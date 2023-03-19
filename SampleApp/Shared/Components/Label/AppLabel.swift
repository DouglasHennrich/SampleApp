//
//  AppLabel.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 22/02/23.
//

import UIKit

class AppLabel: UILabel {
  // MARK: Init
  init() {
    super.init(frame: .zero)
    configureUI()
  }

  convenience init(text: String?) {
    self.init()
    self.text = text
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: Configure UI
private extension AppLabel {
  func configureUI() {
    configureSpecs()
    configureConstraints()
  }

  func configureSpecs() {
    textColor = Colors.label
    font = .systemFont(ofSize: 14)
    textAlignment = .left
  }

  func configureConstraints() {
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      heightAnchor.constraint(greaterThanOrEqualToConstant: 14)
    ])
  }
}
