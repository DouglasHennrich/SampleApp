//
//  WeatherForecastProviderDelegate.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

protocol WeatherForecastProviderDelegate: AnyObject {
  func getWeather(
    _ request: WeatherForecastRequestDTO,
    onCompletion completion: @escaping (Result<WeatherForecast, ServiceError>) -> Void
  )
}
