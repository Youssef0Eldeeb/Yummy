//
//  CatagoryCollectionViewCell.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 30/08/2022.
//

import UIKit
import Kingfisher

class CatagoryCollectionViewCell: UICollectionViewCell {
    
    static let identifire = String(describing: CatagoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    
    func setup(category: DishCategoryStruct){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
    
}
