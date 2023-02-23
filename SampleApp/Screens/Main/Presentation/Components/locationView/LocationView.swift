//
//  LocationView.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 22/02/23.
//

import UIKit

class LocationView: UIView {
  // MARK: Properties

  // MARK: Components
  let iconImageView = UIImageView()
  let cityLabel = AppLabel()

  // MARK: Init
  init() {
    super.init(frame: .zero)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Actions
  func setCity(name: String?) {
    cityLabel.text = name
  }
}

// MARK: Configure UI
private extension LocationView {
  func configureUI() {
    configureSelfConstraints()
    configureIconImageView()
    configureCityLabel()
  }

  func configureSelfConstraints() {
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: 36)
    ])
  }
}

// MARK: Icon
private extension LocationView {
  func configureIconImageView() {
    addSubview(iconImageView)

    configureIconImageViewSpecs()
    configureIconImageViewConstraints()
  }

  func configureIconImageViewSpecs() {
    iconImageView.image = UIImage(systemName: Icons.pinLocation)
    iconImageView.tintColor = Colors.label
  }

  func configureIconImageViewConstraints() {
    let size: CGFloat = 20
    iconImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      iconImageView.widthAnchor.constraint(equalToConstant: size),
      iconImageView.heightAnchor.constraint(equalToConstant: size),
      iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}

// MARK: City Label
private extension LocationView {
  func configureCityLabel() {
    addSubview(cityLabel)

    configureCityLabelSpecs()
    configureCityLabelConstraints()
  }

  func configureCityLabelSpecs() {
    cityLabel.font = .systemFont(ofSize: 14, weight: .bold)
  }

  func configureCityLabelConstraints() {
    NSLayoutConstraint.activate([
      cityLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
      cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
