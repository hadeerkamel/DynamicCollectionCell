//
//  Endpoint.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import Foundation
protocol Endpoint {
  associatedtype ResponseModel: Codable
  func asUrlRequest() throws -> URLRequest
  func validateResponse(response: NetworkClientResponse) -> NetworkError?
}

extension Endpoint{

    func execute(client: NetworkClient = URLSessionClient(), _ completion: @escaping (ResponseModel?, NetworkError?) -> Void, progressCompletion: ((Float) -> Void)? = nil)  {
    do {
      client.executeRequest(try asUrlRequest(), completion: { (response, error) in
        guard let response = response else {
            completion(nil, GenericNetworkError(debugError: error))
            return
          }

          if let error = self.validateResponse(response: response) {
            completion(nil, error)
            return
          }


          do {

            completion(try JSONDecoder().decode(ResponseModel.self, from: response.data), nil)
          } catch let error {
            print(error)
            completion(nil, GenericNetworkError(debugError: error))
            return
          }

      }, progressCompletion: progressCompletion)
    } catch let error {
        completion(nil, GenericNetworkError(debugError: error))
        return
      }
  }
}

enum EndpointMethod: String {
  case get
  case post
}
struct File {
    var fieldName: String
    var fileName: String
    var memeType: String
    var fileData: Data

}
enum EndpointEncoding {
  case query
  case body

    func encode(_ params: [String: Any],_ files: [File] = [], into request: URLRequest) -> URLRequest {
        if params.isEmpty && files.isEmpty{
        return request
    }

    switch self {
    case .query:
        var components = URLComponents(string: request.url!.absoluteString)!

        components.queryItems = params.map({URLQueryItem(name: $0.key, value: $0.value as? String ?? "")})

        var newRequest = request
        newRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        newRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        newRequest.url = components.url!
        return newRequest
    case .body:
        let boundary = "Boundary-\(UUID().uuidString)"

        let body = NSMutableData()
        var newRequest = request
        newRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        newRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        newRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        for (key,value) in params {
            if key.contains("[]"){
                for element in (value as! [Any]){
                    body.appendString(convertFormField(named: key, value: element, using: boundary))
                }
            }else{
                body.appendString(convertFormField(named: key, value: value, using: boundary))
            }
        }
       // let jsonData = try? JSONSerialization.data(withJSONObject: params)
        //body.append((jsonData)!)

        for file in files {
            body.append(convertFileData(fieldName: file.fieldName, fileName: file.fileName, mimeType: file.memeType, fileData: file.fileData, using: boundary))
        }
        body.appendString("--\(boundary)--")

        newRequest.httpBody = body as Data

        return newRequest
    }
  }
    func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
      let data = NSMutableData()

      data.appendString("--\(boundary)\r\n")
      data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")
      data.appendString("Content-Type: \(mimeType)\r\n\r\n")
      data.append(fileData)
      data.appendString("\r\n")

      return data as Data
    }
    func convertFormField(named name: String, value: Any, using boundary: String) -> String {
      var fieldString = "--\(boundary)\r\n"
      fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
      fieldString += "\r\n"
      fieldString += "\(value)\r\n"

      return fieldString
    }

}
extension NSMutableData {
  func appendString(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
}
enum EndpointAuthorization {
  case BearerAuth
  case None

  func authenticate(request: URLRequest) -> URLRequest {

    var newRequest = request

    switch self{
    case .BearerAuth:
        //guard let token = userStoredData.Token else{break}
    let token = ""

        newRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    case .None:
        break
    }


    return newRequest
  }
}

struct UrlRequestInvalidUrlError: Error {}

