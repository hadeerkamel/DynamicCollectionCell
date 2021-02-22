//
//  BaseEndpoint.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import Foundation
protocol BaseEndpoint: Endpoint {
    var path: String {get}
    var method: EndpointMethod {get}
    var encoding: EndpointEncoding {get}
    var params: [String: Any] {get}
    var files: [File] {get}
    var extraHeaders: [String: String] {get}
    var authorization: EndpointAuthorization {get}
}

extension BaseEndpoint {

    func asUrlRequest() throws -> URLRequest {
        guard let url = URL(string: URLs.baseURL + path) else {
            throw UrlRequestInvalidUrlError()
        }

        var request:URLRequest = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(100)

        for (key, value) in extraHeaders {
            request.addValue(value, forHTTPHeaderField: key)
        }

        request = encoding.encode(params,files, into: request)
        request = authorization.authenticate(request: request)

        return request
    }

    func validateResponse(response: NetworkClientResponse) -> NetworkError? {
        GeneralErrorHandling().validate(response: response)
    }
}
