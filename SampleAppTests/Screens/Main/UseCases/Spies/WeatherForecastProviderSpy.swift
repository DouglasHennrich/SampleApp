//
//  WeatherForecastProviderSpy.swift
//  SampleAppTests
//
//  Created by Douglas Hennrich on 07/03/23.
//

import Foundation
@testable import SampleApp

final class WeatherForecastProviderSpy: WeatherForecastProviderDelegate {
  // MARK: Properties
  private var emit: ((WeatherForecastRequestDTO?) -> Void)?
  private var completion: ((Result<WeatherForecast, ServiceError>) -> Void)?

  // MARK: Actions
  func observe(completion: @escaping (WeatherForecastRequestDTO?) -> Void) {
    emit = completion
  }

  func completeWithError(_ error: ServiceError) {
    completion?(.failure(error))
  }

  func completeWithSuccess(_ weatherForecast: WeatherForecast) {
    completion?(.success(weatherForecast))
  }

  // MARK: Actions
  func getWeather(
    _ request: WeatherForecastRequestDTO,
    onCompletion completion: @escaping (Result<WeatherForecast, ServiceError>) -> Void
  ) {
    self.completion = completion

    emit?(request)
  }
}
