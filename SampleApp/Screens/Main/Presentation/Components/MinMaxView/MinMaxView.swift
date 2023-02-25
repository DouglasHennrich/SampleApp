//
//  MinMaxView.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 22/02/23.
//

import UIKit

class MinMaxView: UIView {
  // MARK: Components
  let minLabel = AppLabel(text: "min:")
  let maxLabel = AppLabel(text: "max:")

  // MARK: Init
  init() {
    super.init(frame: .zero)
    configureUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Actions
  func updateWith(min: String?, max: String?) {
    updateMinAttributedString(with: min)
    updateMaxAttributedString(with: max)
  }

  private func updateMinAttributedString(with min: String?) {
    guard var newMinText = min else { return }
    newMinText += "º"
    let fullText = "min: \(newMinText)"

    updateAttributedString(fullText: fullText, toEnlarge: newMinText, component: minLabel)
  }

  private func updateMaxAttributedString(with max: String?) {
    guard var newMaxText = max else { return }
    newMaxText += "º"
    let fullText = "max: \(newMaxText)"

    updateAttributedString(fullText: fullText, toEnlarge: newMaxText, component: maxLabel)
  }
}

// MARK: Helpers
private extension MinMaxView {
  func updateAttributedString(
    fullText: String,
    toEnlarge enlarge: String,
    component: UILabel
  ) {
    let mutableAttributedString = NSMutableAttributedString(
      string: fullText,
      attributes: [
        .font: UIFont.systemFont(ofSize: 10),
        .foregroundColor: Colors.label
      ]
    )

    let range = (fullText as NSString).range(of: enlarge)

    mutableAttributedString.addAttribute(
      .font,
      value: UIFont.systemFont(ofSize: 16, weight: .bold),
      range: range
    )

    component.attributedText = mutableAttributedString
  }
}

// MARK: Configure UI
private extension MinMaxView {
  func configureUI() {
    configureSelfConstraints()
    configureMinLabel()
    configureMaxLabel()
  }

  func configureSelfConstraints() {
    translatesAutoresizingMaskIntoConstraints = false

    backgroundColor = .systemPink

    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: 22)
    ])
  }
}

// MARK: Min Label
private extension MinMaxView {
  func configureMinLabel() {
    addSubview(minLabel)

    configureMinLabelConstraints()
  }

  func configureMinLabelConstraints() {
    NSLayoutConstraint.activate([
      minLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      minLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
      minLabel.widthAnchor.constraint(equalToConstant: 56)
    ])
  }
}

// MARK: Max Label
private extension MinMaxView {
  func configureMaxLabel() {
    addSubview(maxLabel)

    configureMaxLabelConstraints()
  }

  func configureMaxLabelConstraints() {
    NSLayoutConstraint.activate([
      maxLabel.leadingAnchor.constraint(equalTo: minLabel.trailingAnchor, constant: 6),
      maxLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
