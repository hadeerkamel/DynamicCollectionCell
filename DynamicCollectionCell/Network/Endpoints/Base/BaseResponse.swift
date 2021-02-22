//
//  BaseResponse.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//
import Foundation
struct BaseResponse<T: Codable>: Codable{
    let status: Bool
    let code: Int
    let message: String
    let data: T?
}
struct U: Codable {
}
