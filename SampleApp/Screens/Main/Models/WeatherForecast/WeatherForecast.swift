//
//  WeatherForecast.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
// swiftlint:disable nesting

import Foundation

final class WeatherForecast: Codable {
  // MARK: Properties
  var city: String?
  private var coords: Coords?
  private var mainInfo: MainInfo?
  private var sunInfo: SunInfo?
  private var weather: [WeatherInfo]
  private var wind: Wind?

  // MARK: CodingKeys
  enum CodingKeys: String, CodingKey {
    case city = "name"
    case coords = "coord"
    case mainInfo = "main"
    case sunInfo = "sys"
    case weather
    case wind
  }

  // MARK: Init
  init(
    city: String? = nil,
    coords: Coords? = nil,
    mainInfo: MainInfo? = nil,
    sunInfo: SunInfo? = nil,
    weather: [WeatherInfo] = [],
    wind: Wind? = nil
  ) {
    self.city = city
    self.coords = coords
    self.mainInfo = mainInfo
    self.sunInfo = sunInfo
    self.weather = weather
    self.wind = wind
  }
}

// MARK: Computed Variables
extension WeatherForecast {
  var humidity: Int? {
    mainInfo?.humidity
  }

  var minTemp: String? {
    String(format: "%.0f", mainInfo?.minTemp ?? 0.0)
  }

  var maxTemp: String? {
    String(format: "%.0f", mainInfo?.maxTemp ?? 0.0)
  }

  var sunriseAt: Date? {
    sunInfo?.sunrise
  }

  var sunsetAt: Date? {
    sunInfo?.sunset
  }

  var temperature: String {
    String(format: "%.0f", mainInfo?.temperature ?? 0.0)
  }

  var temperatureSensation: String? {
    String(format: "%.0f", mainInfo?.temperatureSensation ?? 0.0)
  }

  var weatherType: WeatherTypeEnum {
    weather.first?.type ?? .unknowed
  }

  var sunriseTime: String {
    guard let sunriseAt = self.sunriseAt else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"

    return dateFormatter.string(from: sunriseAt)
  }

  var sunsetTime: String {
    guard let sunsetAt = self.sunsetAt else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"

    return dateFormatter.string(from: sunsetAt)
  }
}

// MARK: WeatherInfo
extension WeatherForecast {
  class WeatherInfo: Codable {
    var id: Int
    var type: WeatherTypeEnum
    var description: String

    enum CodingKeys: String, CodingKey {
      case id
      case type = "main"
      case description
    }
  }
}

// MARK: Weather Type Enum
extension WeatherForecast {
  enum WeatherTypeEnum: String, Codable {
    case clouds = "Clouds"
    case moon = "Moon"
    case rain = "Rain"
    case snow = "Snow"
    case sun = "Sun"
    case unknowed
  }
}

// MARK: Coords
extension WeatherForecast {
  class Coords: Codable {
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
      case latitude = "lat"
      case longitude = "lon"
    }
  }
}

// MARK: MainInfo
extension WeatherForecast {
  class MainInfo: Codable {
    var temperature: Double
    var temperatureSensation: Double
    var minTemp: Double
    var maxTemp: Double
    var humidity: Int

    enum CodingKeys: String, CodingKey {
      case temperature = "temp"
      case temperatureSensation = "feels_like"
      case minTemp = "temp_min"
      case maxTemp = "temp_max"
      case humidity
    }
  }
}

// MARK: Sunrise & Sunset
extension WeatherForecast {
  class SunInfo: Codable {
    var sunrise: Date
    var sunset: Date
  }
}

// MARK: Wind
extension WeatherForecast {
  class Wind: Codable {
    var speed: Double?
  }
}

// MARK: Equatable
extension WeatherForecast: Equatable {
  static func == (lhs: WeatherForecast, rhs: WeatherForecast) -> Bool {
    return lhs.city == rhs.city
  }
}
