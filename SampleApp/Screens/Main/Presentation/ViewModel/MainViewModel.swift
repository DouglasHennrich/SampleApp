//
//  MainViewModel.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

protocol MainViewModelDelegate: BaseViewModelDelegate {}

class MainViewModel {
  // MARK: Properties
  var stateView: Observable<UIStateViewEnum> = Observable(.normal)
}

extension MainViewModel: MainViewModelDelegate {}
