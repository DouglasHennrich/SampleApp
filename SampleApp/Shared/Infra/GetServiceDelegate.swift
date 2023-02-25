//
//  GetServiceDelegate.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation

protocol GetServiceDelegate: AnyObject {
  func get(
    to url: String,
    with data: Data?,
    onCompletion completion: @escaping (Result<Data, ServiceError>) -> Void
  )
}
