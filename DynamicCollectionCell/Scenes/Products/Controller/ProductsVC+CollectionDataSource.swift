//
//  ProductsVC+CollectionDataSource.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import UIKit
extension ProductsVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.IDETIFIER, for: indexPath) as! ProductCollectionViewCell
        cell.data = products[indexPath.row]
        return cell
    }
}
