//
//  WeatherForecastUseCaseDelegate.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 25/02/23.
//

import Foundation

protocol WeatherForecastUseCaseDelegate: AnyObject {
  func execute(
    _ request: WeatherForecastRequestDTO,
    onCompletion completion: @escaping (Result<WeatherForecast, ServiceError>) -> Void
  )
}
