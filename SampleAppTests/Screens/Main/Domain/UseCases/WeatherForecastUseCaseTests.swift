//
//  WeatherForecastUseCaseTests.swift
//  SampleAppTests
//
//  Created by Douglas Hennrich on 07/03/23.
// swiftlint:disable pattern_matching_keywords

import XCTest
@testable import SampleApp

final class WeatherForecastUseCaseTests: XCTestCase {
  func test_should_get_weather_forecast_if_success() {
    let providerSpy = WeatherForecastProviderSpy()
    let sut = createSut(providerSpy: providerSpy)
    let mockWeatherForecast = createMockedWeatherForecast()

    expect(
      sut,
      completeWith: .success(mockWeatherForecast)
    ) {
      providerSpy.completeWithSuccess(mockWeatherForecast)
    }
  }

  func test_should_fail_weather_forecast_if_error() {
    let providerSpy = WeatherForecastProviderSpy()
    let sut = createSut(providerSpy: providerSpy)

    expect(
      sut,
      completeWith: .failure(.badRequest)
    ) {
      providerSpy.completeWithError(.badRequest)
    }
  }
}

// MARK: Create Sut
extension WeatherForecastUseCaseTests {
  func createSut(
    providerSpy: WeatherForecastProviderDelegate = WeatherForecastProviderSpy()
  ) -> WeatherForecastUseCase {
    let useCase = WeatherForecastUseCase(provider: providerSpy)

    checkMemoryLeak(for: useCase)
    checkMemoryLeak(for: providerSpy)

    return useCase
  }
}

// MARK: Helper
extension WeatherForecastUseCaseTests {
  func expect(
    _ sut: WeatherForecastUseCase,
    completeWith expectedResult: Result<WeatherForecast, ServiceError>,
    when action: @escaping () -> Void,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    let exp = expectation(description: "waiting")

    sut.execute(
      createMockedWeatherForecastRequestDTO()
    ) { receivedResult in
      switch (expectedResult, receivedResult) {
        case (
          .success(let expectedAccount),
          .success(let receivedAccount)
        ):
          XCTAssertEqual(expectedAccount, receivedAccount, file: file, line: line)

        case (
          .failure(let expectedError),
          .failure(let receivedError)
        ):
          XCTAssertEqual(expectedError, receivedError, file: file, line: line)

        default:
          XCTFail(
            "Expected \(expectedResult) received \(receivedResult) instead",
            file: file,
            line: line
          )
      }

      exp.fulfill()
    }

    action()
    wait(for: [exp], timeout: 1)
  }
}
