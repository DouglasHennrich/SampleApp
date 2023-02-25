//
//  AlamofireServiceClient.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 23/02/23.
//

import Foundation
import Alamofire

final class AlamofireServiceClient {
  // MARK: Properties
  let httpRequest: Session

  // MARK: Init
  init(
    sessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
  ) {
    httpRequest = Session(configuration: sessionConfiguration)
  }

  // MARK: Actions
  func buildUrl(
    url urlString: String,
    method: HTTPMethod,
    headers: HTTPHeaders? = nil,
    parameters: Parameters?
  ) throws -> URLRequestConvertible {
    let url = try urlString.asURL()
    var urlRequest = URLRequest(url: url)

    // Http method
    urlRequest.httpMethod = method.rawValue

    // Header
    if let headers = headers {
      headers.forEach { element in
        urlRequest.setValue(element.value, forHTTPHeaderField: element.name)
      }
    }

    // Encoding
    let encoding: ParameterEncoding = {
      switch method {
        case .get:
          return URLEncoding.default
        default:
          return JSONEncoding.default
      }
    }()

    return try encoding.encode(urlRequest, with: parameters)
  }
}

// MARK: Get Delegate
extension AlamofireServiceClient: GetServiceDelegate {
  func get(
    to url: String,
    with data: Data?,
    onCompletion completion: @escaping (Result<Data, ServiceError>) -> Void
  ) {
    guard var parameters = data?.toJson() else {
      completion(.failure(.cantCreatePayload))
      return
    }

    let defaultParameters = [
      "APPID": AppConfigs.shared.APIKey,
      "lang": "pt_br",
      "units": "metric"
    ]

    parameters = parameters.merging(defaultParameters) { _, new in new }

    guard let urlRequestConvirtable = try? self.buildUrl(
      url: url,
      method: .get,
      parameters: parameters
    ) else {
      return completion(.failure(.cantCreateUrl))
    }

    httpRequest.request(urlRequestConvirtable)
      .validate()
      .responseData { [weak self] response in
        guard self != nil else { return }

        switch response.result {
          case .success(let data):
            completion(.success(data))

          case .failure(let error):
            completion(.failure(.init(status: error.responseCode)))
        }
      }
  }
}
