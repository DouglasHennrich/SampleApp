//
//  BaseViewModel.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
  var stateView: Observable<UIStateViewEnum> { get set }
}
