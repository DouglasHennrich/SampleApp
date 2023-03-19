//
//  LoadingView.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import UIKit

final class LoadingView: UIView {
  // MARK: Components
  let activityIndicator = UIActivityIndicatorView(style: .large)
  let messageLabel = AppLabel()

  // MARK: Init
  init() {
    super.init(frame: .zero)
    configureUI()
  }

  convenience init(message: String?) {
    self.init()

    messageLabel.text = message
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Actions
  func show() {
    executeOnMain { [weak self] in
      guard let self = self else { return }
      self.isHidden = false

      self.activityIndicator.startAnimating()
    }
  }

  func hide() {
    executeOnMain { [weak self] in
      guard let self = self else { return }
      self.isHidden = true

      self.activityIndicator.stopAnimating()
    }
  }
}

// MARK: Helpers
private extension LoadingView {
  func executeOnMain(completion: @escaping () -> Void) {
    guard Thread.isMainThread else {
      DispatchQueue.main.async { [weak self] in
        guard let self = self else { return }

        self.executeOnMain(completion: completion)
      }
      return
    }

    completion()
  }
}

// MARK: Configure UI
private extension LoadingView {
  func configureUI() {
    configureSelfSpecs()
    configureSelfConstraints()
    configureActivityIndicator()
    configureMessageLabel()
  }

  func configureSelfSpecs() {
    isHidden = true
    layer.cornerRadius = 6
    layer.borderWidth = 1
    layer.borderColor = Colors.label.cgColor
    backgroundColor = Colors.background
  }

  func configureSelfConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
  }
}

// MARK: Activity Indicator
private extension LoadingView {
  func configureActivityIndicator() {
    addSubview(activityIndicator)

    configureActivityIndicatorSpecs()
    configureActivityIndicatorConstraints()
  }

  func configureActivityIndicatorSpecs() {
    activityIndicator.color = Colors.primary
    activityIndicator.hidesWhenStopped = true
  }

  func configureActivityIndicatorConstraints() {
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 12),
      activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
}

// MARK: Message Label
private extension LoadingView {
  func configureMessageLabel() {
    addSubview(messageLabel)

    configureMessageLabelSpecs()
    configureMessageLabelConstraints()
  }

  func configureMessageLabelSpecs() {
    messageLabel.textAlignment = .center
    messageLabel.text = "carregando"
  }

  func configureMessageLabelConstraints() {
    let padding: CGFloat = 12

    NSLayoutConstraint.activate([
      messageLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 6),
      messageLabel.leadingAnchor.constraint(
        equalTo: leadingAnchor,
        constant: padding
      ),
      messageLabel.trailingAnchor.constraint(
        equalTo: trailingAnchor,
        constant: -padding
      ),
      messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
    ])
  }
}
