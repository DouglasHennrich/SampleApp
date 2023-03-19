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
    configureComponentsContainer()
    configureLocationView()
    configureTemperatureLabel()
    configureWeatherLabel()
    configureMinMaxView()
    configureLoadingView()
  }

  func configureSelf() {
    backgroundColor = Colors.background
  }
}

// MARK: Components Container
private extension MainView {
  func configureComponentsContainer() {
    addSubview(componentsContainer)

    configureComponentsContainerConstraints()
  }

  func configureComponentsContainerConstraints() {
    componentsContainer.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      componentsContainer.topAnchor.constraint(equalTo: topAnchor),
      componentsContainer.leadingAnchor.constraint(
        equalTo: leadingAnchor,
        constant: leadingTrailingPadding
      ),
      componentsContainer.trailingAnchor.constraint(
        equalTo: trailingAnchor,
        constant: -leadingTrailingPadding
      ),
      componentsContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

// MARK: LocationView
private extension MainView {
  func configureLocationView() {
    componentsContainer.addSubview(locationView)

    configureLocationViewConstraints()

    locationView.setCity(name: "Estância Velha")
  }

  func configureLocationViewConstraints() {
    NSLayoutConstraint.activate([
      locationView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
      locationView.leadingAnchor.constraint(equalTo: componentsContainer.leadingAnchor)
    ])
  }
}

// MARK: Temperature Label
private extension MainView {
  func configureTemperatureLabel() {
    componentsContainer.addSubview(temperatureLabel)

    configureTemperatureLabelSpecs()
    configureTemperatureLabelConstraints()
  }

  func configureTemperatureLabelSpecs() {
    temperatureLabel.font = .systemFont(ofSize: 62, weight: .bold)
    temperatureLabel.text = "19º"
    temperatureLabel.textColor = Colors.primary
  }

  func configureTemperatureLabelConstraints() {
    NSLayoutConstraint.activate([
      temperatureLabel.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 8),
      temperatureLabel.leadingAnchor.constraint(equalTo: componentsContainer.leadingAnchor)
    ])
  }
}

// MARK: Weather Label
private extension MainView {
  func configureWeatherLabel() {
    componentsContainer.addSubview(weatherLabel)

    configureWeatherLabelSpecs()
    configureWeatherLabelConstraints()
  }

  func configureWeatherLabelSpecs() {
    weatherLabel.text = "Nublado"
  }

  func configureWeatherLabelConstraints() {
    NSLayoutConstraint.activate([
      weatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8),
      weatherLabel.leadingAnchor.constraint(equalTo: componentsContainer.leadingAnchor)
    ])
  }
}

// MARK: Min Max View
private extension MainView {
  func configureMinMaxView() {
    componentsContainer.addSubview(minMaxView)

    configureMinMaxViewSpecs()
    configureMinMaxViewConstraints()
  }

  func configureMinMaxViewSpecs() {
    minMaxView.updateWith(min: "13", max: "22")
  }

  func configureMinMaxViewConstraints() {
    NSLayoutConstraint.activate([
      minMaxView.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 6),
      minMaxView.leadingAnchor.constraint(equalTo: componentsContainer.leadingAnchor)
    ])
  }
}

// MARK: LoadingView
private extension MainView {
  func configureLoadingView() {
    addSubview(loadingView)

    configureLoadingViewConstraints()
  }

  func configureLoadingViewConstraints() {
    NSLayoutConstraint.activate([
      loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
      loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
