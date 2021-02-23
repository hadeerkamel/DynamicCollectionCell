//
//  ProductsViewProtocol.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/23/21.
//

import Foundation
protocol ProductsViewProtocol{
    func gotProductsData(data: [Product])
}
extension ProductsVC: ProductsViewProtocol{
    func gotProductsData(data: [Product]){
        DispatchQueue.main.async {
            self.products = data
            self.collectionView.reloadData()
        }
    }
}
