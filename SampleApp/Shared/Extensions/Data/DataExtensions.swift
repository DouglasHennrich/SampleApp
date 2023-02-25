//
//  DataExtensions.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

extension Data {
  func toModel<T: Decodable>() -> T? {
    try? JSONDecoder().decode(T.self, from: self)
  }

  func toJson() -> [String: Any]? {
    try? JSONSerialization.jsonObject(
      with: self,
      options: .allowFragments
    ) as? [String: Any]
  }

  func convertString() -> String {
    return String(data: self, encoding: .utf8) ?? "Não pode ser convertida"
  }
}
