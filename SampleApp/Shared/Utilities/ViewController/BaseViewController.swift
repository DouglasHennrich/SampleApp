//
//  BaseViewController.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController, UIStateViewDelegate {
  // MARK: Properties
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  // MARK: Components
  var customView: T? {
    return view as? T
  }

  // MARK: Life Cycle
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = T()
  }

  // MARK: Actions
  func dismissKeyboard() {
    customView?.endEditing(true)
  }

  func changeUIStateView(_ newState: UIStateViewEnum) {
    print("Must be implemented")
  }
}
