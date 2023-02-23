//
//  AppCoordinator+MainFactory.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

extension AppCoordinator {
  func createMainViewController() -> MainViewController {
    let viewModel = createMainViewModel()
    let vc = MainViewController.initialize(viewModel: viewModel)

    mainViewModel = viewModel

    return vc
  }

  private func createMainViewModel() -> MainViewModelDelegate {
    let viewModel = MainViewModel()

    return viewModel
  }
}
