//
//  NetworkClient.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import Foundation
protocol NetworkClient {
  func executeRequest(_ request: URLRequest, completion: @escaping (NetworkClientResponse?, Error?) -> Void, progressCompletion: ((Float) -> Void)?)
}

struct NetworkClientResponse {
  let data: Data
  let statusCode: Int
  let headers: [String: String]
}
