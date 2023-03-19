//
//  WeatherForecastRequestDTO.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

final class WeatherForecastRequestDTO: Encodable {
  // MARK: Properties
  var latitude: Double
  var longitude: Double

  // MARK: Init
  init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }

  // MARK: CodingKeys
  enum CodingKeys: String, CodingKey {
    case latitude = "lat"
    case longitude = "lon"
  }
}

// MARK: Equatable
extension WeatherForecastRequestDTO: Equatable {
  static func == (lhs: WeatherForecastRequestDTO, rhs: WeatherForecastRequestDTO) -> Bool {
    return (lhs.latitude == rhs.latitude) && (lhs.longitude == rhs.longitude)
  }
}
