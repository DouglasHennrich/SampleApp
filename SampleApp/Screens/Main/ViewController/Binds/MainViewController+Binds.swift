//
//  MainViewController+Binds.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

extension MainViewController {
  func configureBinds() {
    viewModel?.stateView.observe(on: self) { [weak self] newStateView in
      guard let self = self else { return }

      self.customView?.changeUIStateView(newStateView)
    }

    viewModel?.weatherForecast.observe(on: self) { [weak self] weatherForecast in
      guard let self = self else { return }
      guard let weatherForecast = weatherForecast else { return }

      self.customView?.updateWeatherForecast(with: weatherForecast)
    }
  }
}
