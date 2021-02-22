//
//  DynamicProductLayoutAttributes.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import UIKit

class DynamicProductLayoutAttributes: UICollectionViewLayoutAttributes {

    var imageHeight: CGFloat = 0

    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! DynamicProductLayoutAttributes
        copy.imageHeight = imageHeight
        return copy
    }

    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? DynamicProductLayoutAttributes {
            if attributes.imageHeight == imageHeight {
                return super.isEqual(object)
            }
        }
        return false
    }

}

extension ProductCollectionViewCell {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? DynamicProductLayoutAttributes {
            imageHeight = attributes.imageHeight
            // imageAcpectRatioConstraint  not related to DynamicGallery
            //imageAcpectRatioConstraint.isActive = false
        }
    }

}
