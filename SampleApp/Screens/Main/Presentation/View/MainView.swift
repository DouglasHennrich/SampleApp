//
//  MainView.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import UIKit

class MainView: UIView {
  // MARK: Properties

  // MARK: Components
  let locationView = LocationView()
  let temperatureLabel = AppLabel()

  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
