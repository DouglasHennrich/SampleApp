//
//  File.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

enum UIStateViewEnum: Equatable {
  static func == (lhs: UIStateViewEnum, rhs: UIStateViewEnum) -> Bool {
    switch (lhs, rhs) {
      case (.normal, .normal),
        (.loading, .loading),
        (.error, .error),
        (.empty, .empty):
        return true

      default:
        return false
    }
  }

  case normal
  case loading
  case error(_ error: ServiceError?)
  case empty
}

protocol UIStateViewDelegate: AnyObject {
  func changeUIStateView(_ newState: UIStateViewEnum)
}
