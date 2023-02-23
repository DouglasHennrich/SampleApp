//
//  MainView+Layouts.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 22/02/23.
//

import UIKit

// MARK: Configure UI
extension MainView {
  func configureUI() {
    configureSelf()
    configureLocationView()
  }

  func configureSelf() {
    backgroundColor = Colors.background
  }
}

// MARK: LocationView
private extension MainView {
  func configureLocationView() {
    addSubview(locationView)

    configureLocationViewConstraints()

    locationView.setCity(name: "Estância Velha")
  }

  func configureLocationViewConstraints() {
    NSLayoutConstraint.activate([
      locationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
      locationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
    ])
  }
}
