//
//  MainViewModel.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

class MainViewModel {
  // MARK: Properties
  var weatherForecastUseCase: WeatherForecastUseCaseDelegate?

  var stateView: Observable<UIStateViewEnum> = Observable(.normal)
  var weatherForecast: Observable<WeatherForecast?> = Observable(nil)

  // MARK: Init
  init(weatherForecastUseCase: WeatherForecastUseCaseDelegate? = nil) {
    self.weatherForecastUseCase = weatherForecastUseCase
  }
}

extension MainViewModel: MainViewModelDelegate {
  func getWeatherForecast() {
    stateView.value = .loading

    let request = WeatherForecastRequestDTO(
      latitude: -29.6580027,
      longitude: -51.1689972
    )

    weatherForecastUseCase?.execute(request) { [weak self] result in
      guard let self = self else { return }
      self.stateView.value = .normal

      switch result {
        case .success(let weather):
          self.weatherForecast.value = weather

        case .failure(let error):
          self.stateView.value = .error(error)
      }
    }
  }
}
