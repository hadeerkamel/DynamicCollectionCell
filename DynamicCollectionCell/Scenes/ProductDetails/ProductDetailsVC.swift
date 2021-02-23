//
//  ProductDetailsVC.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import UIKit
class ProductDetailsVC: UIViewController {

    //MARK: - Properties -
    var data: Product?{
        didSet{
            guard let data = data else{return}
           // imageView.image = data.image
            //priceLabel.text = data.price
        }
    }
    //MARK: - Life cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }
    //MARK: - Setup views -
    func setupViews(){
        view.backgroundColor = .white

        view.addSubview(imageView)
        imageView.fillSuperview()

        imageView.addSubview(priceLabel)
        priceLabel.anchor(top: imageView.topAnchor, leading: imageView.leadingAnchor, padding: UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0))
    }
    //MARK: - UI Components -
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.font = label.font.withSize(15)
        return label
    }()
}
