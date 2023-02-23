//
//  Coordinator.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController? { get set }

  func start()
}
