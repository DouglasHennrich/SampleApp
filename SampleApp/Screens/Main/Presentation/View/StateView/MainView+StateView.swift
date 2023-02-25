//
//  MainView+StateView.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

extension MainView: UIStateViewDelegate {
  func changeUIStateView(_ newState: UIStateViewEnum) {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }

      switch newState {
        case .normal:
          self.changeUIStateViewToNormal()

        case .loading:
          self.changeUIStateViewToLoading()

        default: break
      }
    }
  }
}

// MARK: Normal State
private extension MainView {
  func changeUIStateViewToNormal() {
    componentsContainer.isHidden = false

    loadingView.hide()
  }
}

// MARK: Loading State
private extension MainView {
  func changeUIStateViewToLoading() {
    componentsContainer.isHidden = true

    loadingView.show()
  }
}
