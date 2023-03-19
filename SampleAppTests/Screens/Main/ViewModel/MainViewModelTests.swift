//
//  MainViewModelTests.swift
//  SampleAppTests
//
//  Created by Douglas Hennrich on 25/02/23.

import XCTest
@testable import SampleApp

final class MainViewModelTests: XCTestCase {
  func test_should_set_state_view_to_loading_when_retrieving_weather_forecast() {
    let sut = createSut()

    XCTAssertEqual(sut.stateView.value, .normal)
    sut.getWeatherForecast()
    XCTAssertEqual(sut.stateView.value, .loading)
  }

  func test_should_set_state_view_to_normal_on_success_weather_forecast() {
    let weatherUseCaseSpy = WeatherForecastUseCaseSpy()
    let sut = createSut(weatherForecastUseCaseSpy: weatherUseCaseSpy)

    XCTAssertEqual(sut.stateView.value, .normal)
    sut.getWeatherForecast()
    XCTAssertEqual(sut.stateView.value, .loading)
    weatherUseCaseSpy.completeWithSuccess(createMockedWeatherForecast())
    XCTAssertEqual(sut.stateView.value, .normal)
  }

  func test_should_set_state_view_to_error_on_fail_weather_forecast() {
    let weatherUseCaseSpy = WeatherForecastUseCaseSpy()
    let sut = createSut(weatherForecastUseCaseSpy: weatherUseCaseSpy)

    XCTAssertEqual(sut.stateView.value, .normal)
    sut.getWeatherForecast()
    XCTAssertEqual(sut.stateView.value, .loading)
    weatherUseCaseSpy.completeWithError(.badRequest)
    XCTAssertEqual(sut.stateView.value, .error(.badRequest))
  }

  func test_weatherForecastUseCase_should_receive_requestDTO() {
    let weatherUseCaseSpy = WeatherForecastUseCaseSpy()
    let sut = createSut(weatherForecastUseCaseSpy: weatherUseCaseSpy)
    let exp = expectation(description: "waiting")

    weatherUseCaseSpy.observe { DTO in
      XCTAssertNotNil(DTO)
      exp.fulfill()
    }

    sut.getWeatherForecast()
    wait(for: [exp], timeout: 1)
  }

  func test_should_get_weather_forecast_if_success() {
    let weatherUseCaseSpy = WeatherForecastUseCaseSpy()
    let sut = createSut(weatherForecastUseCaseSpy: weatherUseCaseSpy)
    let mockedWeatherForecast = createMockedWeatherForecast()

    XCTAssertNil(sut.weatherForecast.value)

    sut.getWeatherForecast()
    weatherUseCaseSpy.completeWithSuccess(mockedWeatherForecast)

    XCTAssertEqual(sut.weatherForecast.value, mockedWeatherForecast)
  }

  func test_should_fail_weather_forecast_if_error() {
    let weatherUseCaseSpy = WeatherForecastUseCaseSpy()
    let sut = createSut(weatherForecastUseCaseSpy: weatherUseCaseSpy)

    XCTAssertNil(sut.weatherForecast.value)

    sut.getWeatherForecast()
    weatherUseCaseSpy.completeWithError(.badRequest)

    XCTAssertNil(sut.weatherForecast.value)
  }
}

// MARK: Create SUT
extension MainViewModelTests {
  func createSut(
    weatherForecastUseCaseSpy: WeatherForecastUseCaseDelegate = WeatherForecastUseCaseSpy()
  ) -> MainViewModel {
    let viewModel = MainViewModel(weatherForecastUseCase: weatherForecastUseCaseSpy)

    checkMemoryLeak(for: viewModel)
    checkMemoryLeak(for: weatherForecastUseCaseSpy)

    return viewModel
  }
}
