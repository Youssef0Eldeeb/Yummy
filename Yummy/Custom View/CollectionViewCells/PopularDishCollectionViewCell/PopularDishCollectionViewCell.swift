//
//  CollectionViewCell.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 31/08/2022.
//

import UIKit

class PopularDishCollectionViewCell: UICollectionViewCell {

    static let identifire = String(describing: PopularDishCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func setup(dish: PopularDishStruct){
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
    
}
