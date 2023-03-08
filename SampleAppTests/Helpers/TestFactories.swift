//
//  File.swift
//  SampleAppTests
//
//  Created by Douglas Hennrich on 03/03/23.
//

import Foundation
@testable import SampleApp

func createMockedWeatherForecastRequestDTO() -> WeatherForecastRequestDTO {
  WeatherForecastRequestDTO(
    latitude: -29.6580027,
    longitude: -51.1689972
  )
}

func createMockedWeatherForecast() -> WeatherForecast {
  WeatherForecast(city: "Mocked City")
}
