//
//  File.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

enum UIStateViewEnum {
  case normal
  case loading
  case error(_ error: Error?)
  case empty
}

protocol UIStateViewDelegate: AnyObject {
  func changeUIStateView(_ newState: UIStateViewEnum)
}
