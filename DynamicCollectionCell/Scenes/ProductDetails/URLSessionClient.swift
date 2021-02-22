//
//  URLSessionClient.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import Foundation
class URLSessionClient: NSObject, NetworkClient, URLSessionTaskDelegate {

  private var progress: ((Float) -> Void)?

  func executeRequest(_ request: URLRequest, completion: @escaping (NetworkClientResponse?, Error?) -> Void, progressCompletion: ((Float) -> Void)?) {
   print(request)
    self.progress = progressCompletion

    let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    session.dataTask(with: request){ (data, response, error) -> Void in

      guard let data = data, let response = response as? HTTPURLResponse else {
        completion(nil, error)
        return
      }

      print(String(data: data, encoding: String.Encoding.utf8) ?? "")

      completion(NetworkClientResponse(data: data,
                                       statusCode: response.statusCode,
                                       headers: response.allHeaderFields as? [String: String] ?? [:]), nil)
    }.resume()

    session.finishTasksAndInvalidate()
  }

  func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
    progress?(Float(totalBytesSent/totalBytesExpectedToSend))
  }
}
