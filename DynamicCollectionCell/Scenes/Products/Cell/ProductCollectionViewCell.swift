//
//  ProductCollectionViewCell.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/22/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties -
    static let IDETIFIER = "ProductCollectionViewCell"
    var data: Product?{
        didSet{
            guard let data = data else{return}
            imageHeight = CGFloat(data.image.height)
            imageView.setImage(urlString: data.image.url)
            descLabel.text = data.productDescription
            priceLabel.text = "\(data.price)$"
        }
    }
    var imageHeight: CGFloat = 100
    //MARK: - Life cycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
   
    //MARK: - Setup Views -
    func setupViews(){
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        contentView.addSubview(stackView)
        stackView.fillSuperview()

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descLabel)

        //imageView.anchor(size: CGSize(width: 0, height: imageHeight))
        
        stackView.addSubview(priceLabel)
        priceLabel.anchor(top: stackView.topAnchor, trailing: stackView.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10))
    }
    //MARK: - UI Components -
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "500$"
        label.font = label.font.withSize(13)
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    let descLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
}
