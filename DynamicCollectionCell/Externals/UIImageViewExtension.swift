//
//  UIImageViewExtension.swift
//  DynamicCollectionCell
//
//  Created by Hadeer Kamel on 2/23/21.
//

import UIKit

extension UIImageView{
    func setImage(urlString: String){
        guard let url = URL(string: urlString) else{ return }
        getData(from: url){ (data, response, error) in
            guard let data = data else{return}
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    self.image = image
                }
            }
        }
    }
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
