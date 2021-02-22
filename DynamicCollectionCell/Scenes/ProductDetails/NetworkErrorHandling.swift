//
//  NetworkErrorHandling.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import Foundation
protocol NetworkErrorHandling {
  func validate(response: NetworkClientResponse) -> NetworkError?
}

protocol NetworkError {
  var message: String {get}
  var code: String {get}
  var debug: Error? {get}
}
