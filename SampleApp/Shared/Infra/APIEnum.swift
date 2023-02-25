//
//  APIEnum.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

enum APIEnum: String {
  case weather = "/weather"

  var url: String {
    AppConfigs.shared.baseUrl + self.rawValue
  }
}
