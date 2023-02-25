//
//  AppCoordinator+MainFactory.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

extension AppCoordinator {
  func createMainViewController() -> MainViewController {
    let weatherProvider = createWeatherForecastProvider()
    let weatherForecastUseCase = createWeatherForecastUseCase(
      provider: weatherProvider
    )
    let viewModel = createMainViewModel(
      weatherForecastUseCase: weatherForecastUseCase
    )
    let vc = MainViewController.initialize(viewModel: viewModel)

    mainViewModel = viewModel

    return vc
  }
}

private extension AppCoordinator {
  func createMainViewModel(
    weatherForecastUseCase: WeatherForecastUseCaseDelegate?
  ) -> MainViewModelDelegate {
    let viewModel = MainViewModel(weatherForecastUseCase: weatherForecastUseCase)

    return viewModel
  }

  func createWeatherForecastUseCase(
    provider: WeatherForecastProviderDelegate?
  ) -> WeatherForecastUseCaseDelegate? {
    WeatherForecastUseCase(provider: provider)
  }

  func createWeatherForecastProvider() -> WeatherForecastProviderDelegate? {
    WeatherForecastProvider()
  }
}
