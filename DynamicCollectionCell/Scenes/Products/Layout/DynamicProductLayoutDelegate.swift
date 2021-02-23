//
//  DynamicProductLayoutDelegate.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//


import UIKit
import AVFoundation

protocol DynamicProductLayoutDelegate {

    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat

    func collectionView(_ collectionView: UICollectionView, heightForDescriptionAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}

extension ProductsVC: DynamicProductLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let product = products[indexPath.item]
        //let image = product.image
       // let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        // insideRect : The bounding rectangle you want to fit into.
        //let rect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        return CGFloat(product.image.height)
    }

    func collectionView(_ collectionView: UICollectionView, heightForDescriptionAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let product = products[indexPath.item]
        let descriptionHeight = heightForText(product.productDescription, width: width-24)
        // 24 title //  15 subtitle // 8 top
        let height = 10 + descriptionHeight + 10
        return height
    }

    func heightForText(_ text: String, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 15)
        let rect = NSString(string: text).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
                                                       options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font],
                                                       context: nil)
        return ceil(rect.height)
    }
}
extension ProductsVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns = 2
        let cellPadding: CGFloat = 5
        let insets = collectionView.contentInset

        let columnWidth = (collectionView.bounds.width - (insets.left + insets.right)) / CGFloat(numberOfColumns)

        let width = columnWidth - (cellPadding * 2)

        return CGSize(width: width, height:width+200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets.init(top: 12, left: 2, bottom: 0, right: 2)
    }
}
