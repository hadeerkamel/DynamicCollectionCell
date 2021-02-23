//
//  GetProductsEndpoint.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/23/21.
//

import Foundation
struct GetProductsEndpoint: BaseEndpoint {
    typealias ResponseModel = [Product]

    var path: String = URLs.products
    var method: EndpointMethod = .get
    var encoding: EndpointEncoding = .query
    var params: [String : Any] = [:]
    var files: [File] = []
    var extraHeaders: [String : String] = [:]
    var authorization: EndpointAuthorization = .None

    init(fromIndex: Int, count: Int){
        params = [
            "count": String(count),
            "from": String(fromIndex)
        ]
    }
}
// MARK: - Product
struct Product: Codable {
    let id: Int
    let productName, productDescription: String
    let image: Image
    let price: Int
}

// MARK: - Image
struct Image: Codable {
    let width, height: Int
    let url: String
}
