//
//  WeatherForecastUseCase.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

final class WeatherForecastUseCase: WeatherForecastUseCaseDelegate {
  // MARK: Properties
  var provider: WeatherForecastProviderDelegate?

  // MARK: Init
  init(provider: WeatherForecastProviderDelegate? = WeatherForecastProvider()) {
    self.provider = provider
  }

  // MARK: Actions
  func execute(
    _ request: WeatherForecastRequestDTO,
    onCompletion completion: @escaping (Result<WeatherForecast, ServiceError>) -> Void
  ) {
    provider?.getWeather(request, onCompletion: completion)
  }
}
