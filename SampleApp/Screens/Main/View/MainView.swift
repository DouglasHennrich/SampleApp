//
//  MainView.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import UIKit

final class MainView: UIView {
  // MARK: Properties
  weak var delegate: MainViewDelegate?
  let leadingTrailingPadding: CGFloat = 22

  // MARK: Components
  let componentsContainer = UIView()
  let locationView = LocationView()
  let temperatureLabel = AppLabel()
  let weatherLabel = AppLabel()
  let minMaxView = MinMaxView()

  let loadingView = LoadingView()

  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: Actions
extension MainView {
  func updateWeatherForecast(with weather: WeatherForecast) {
    locationView.setCity(name: weather.city)
    temperatureLabel.text = "\(weather.temperature)º"
    weatherLabel.text = weather.weatherType.rawValue
    minMaxView.updateWith(min: weather.minTemp, max: weather.maxTemp)
  }
}
