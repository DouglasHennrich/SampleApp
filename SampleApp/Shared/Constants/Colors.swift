//
//  Colors.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 22/02/23.
//

import UIKit

enum Colors {
  static let primary = UIColor(r: 98, g: 71, b: 170)
  static let secondary = UIColor(r: 160, g: 108, b: 213)
  static let label = UIColor(r: 226, g: 207, b: 234)

  static let background = UIColor(r: 6, g: 39, b: 38)
  static let backgroundSoft = UIColor(r: 16, g: 43, b: 63)
}

// swiftlint:disable identifier_name
extension UIColor {
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: 1.0)
  }

  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
  }
}
