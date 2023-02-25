//
//  MainViewModelDelegate.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

protocol MainViewModelDelegate: BaseViewModelDelegate {
  var weatherForecast: Observable<WeatherForecast?> { get }

  func getWeatherForecast()
}
