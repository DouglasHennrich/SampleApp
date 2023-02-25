//
//  AppConfigs.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

class AppConfigs {
  // MARK: Properties
  static let shared = AppConfigs()
  var APIKey = ""
  var baseUrl = ""

  // MARK: Init
  private init() {
    guard let path = Bundle.main.path(
      forResource: "Configs",
      ofType: "plist"
    )
    else {
      return
    }

    let url = URL(fileURLWithPath: path)

    guard let data = try? Data(contentsOf: url),
          let plist = try? PropertyListSerialization.propertyList(
            from: data,
            options: .mutableContainers,
            format: nil
          ) as? [String: Any]
    else {
      return
    }

    if let APIKey = plist["APIKey"] as? String {
      self.APIKey = APIKey
    }

    if let baseUrl = plist["baseUrl"] as? String {
      self.baseUrl = baseUrl
    }
  }
}
