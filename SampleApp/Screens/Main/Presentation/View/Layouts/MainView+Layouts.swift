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
    configureTemperatureLabel()
    configureWeatherLabel()
    configureMinMaxView()
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
      locationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingPadding)
    ])
  }
}

// MARK: Temperature Label
private extension MainView {
  func configureTemperatureLabel() {
    addSubview(temperatureLabel)

    configureTemperatureLabelSpecs()
    configureTemperatureLabelConstraints()
  }

  func configureTemperatureLabelSpecs() {
    temperatureLabel.font = .systemFont(ofSize: 62, weight: .bold)
    temperatureLabel.text = "19º"
  }

  func configureTemperatureLabelConstraints() {
    NSLayoutConstraint.activate([
      temperatureLabel.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 8),
      temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingPadding)
    ])
  }
}

// MARK: Weather Label
private extension MainView {
  func configureWeatherLabel() {
    addSubview(weatherLabel)

    configureWeatherLabelSpecs()
    configureWeatherLabelConstraints()
  }

  func configureWeatherLabelSpecs() {
    weatherLabel.text = "Nublado"
  }

  func configureWeatherLabelConstraints() {
    NSLayoutConstraint.activate([
      weatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8),
      weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingPadding)
    ])
  }
}

// MARK: Min Max View
private extension MainView {
  func configureMinMaxView() {
    addSubview(minMaxView)

    configureMinMaxViewSpecs()
    configureMinMaxViewConstraints()
  }

  func configureMinMaxViewSpecs() {
    minMaxView.updateWith(min: "13", max: "22")
  }

  func configureMinMaxViewConstraints() {
    NSLayoutConstraint.activate([
      minMaxView.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 6),
      minMaxView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingPadding)
    ])
  }
}
