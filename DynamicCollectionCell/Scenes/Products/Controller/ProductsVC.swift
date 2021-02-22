//
//  ProductsVC.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import UIKit
struct Product{
    let image: UIImage
    let description: String
    let price: String
    let imageHeight: CGFloat
}
class ProductsVC: UIViewController {

    //MARK: - Properties -
    var products: [Product] = []
    let layout =  DynamicProductLayout()
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.IDETIFIER)

        layout.delegate = self
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)

        products = [
            Product(image: #imageLiteral(resourceName: "result"), description: "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;kkkkkkkkkkkkkkllllllllllllllllllllllllllllllllllllllllllllllllllllllh", price: "500", imageHeight: 150),
            Product(image: #imageLiteral(resourceName: "result"), description: "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkll", price: "500", imageHeight: 100),
            Product(image: #imageLiteral(resourceName: "result"), description: "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkll", price: "500", imageHeight: 80),
            Product(image: #imageLiteral(resourceName: "result"), description: "kkknmk;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkll", price: "500", imageHeight: 200)
        ]

    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }
    //MARK: - Setup views -
    func setupViews(){
        view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
    }

    //MARK: - UI Constants -
    let collectionView: UICollectionView = {

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)

        collectionView.backgroundColor = .clear
        return collectionView
    }()
}

