//
//  AppCoordinator.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import UIKit

class AppCoordinator: Coordinator {
  // MARK: Properties
  var navigationController: UINavigationController?
  var mainViewModel: MainViewModelDelegate?

  // MARK: Components

  // MARK: Init
  init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  // MARK: Start
  func start() {
    let viewController = createMainViewController()

    navigationController?.viewControllers = [viewController]
  }
}
