//
//  ProductsPresenter.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/23/21.
//

import Foundation

protocol ProductsPresenter {
    func presentProducts()
}
class ProductsPresenterImpl: ProductsPresenter{
    private var startIndex = 1
    private let count = 10
    private var view: ProductsViewProtocol

    init(view: ProductsViewProtocol){
        self.view = view
    }

    func presentProducts(){
        GetProductsEndpoint(fromIndex: startIndex, count: 10).execute { (products, error) in
            if let data = products{
                self.startIndex += self.count
                self.view.gotProductsData(data: data)
            }
        }
    }
}
