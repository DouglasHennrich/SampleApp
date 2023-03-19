//
//  WeatherForecastRepository.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation
import CoreLocation

final class WeatherForecastProvider: WeatherForecastProviderDelegate {
  // MARK: Properties
  var service: GetServiceDelegate?

  // MARK: Init
  init(service: GetServiceDelegate? = AlamofireServiceClient()) {
    self.service = service
  }

  // MARK: Actions
  func getWeather(
    _ request: WeatherForecastRequestDTO,
    onCompletion completion: @escaping (Result<WeatherForecast, ServiceError>) -> Void
  ) {
    service?.get(
      to: APIEnum.weather.url,
      with: request.toData()
    ) { [weak self] result in
      guard let self = self else { return }

      switch result {
        case .success(let data):
          self.onGetWeatherSuccess(data: data, onCompletion: completion)

        case .failure(let error):
          completion(.failure(error))
      }
    }
  }

  func onGetWeatherSuccess(
    data: Data,
    onCompletion completion: @escaping (Result<WeatherForecast, ServiceError>) -> Void
  ) {
    do {
      let result = try JSONDecoder().decode(WeatherForecast.self, from: data)

      completion(.success(result))
    } catch let error as NSError {
      completion(.failure(.unknow((error.debugDescription, nil))))
    }
  }
}
