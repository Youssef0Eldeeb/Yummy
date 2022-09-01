//
//  DishListTableViewCell.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 31/08/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifire = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(dish: DishStruct){
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        descriptionLabel.text = dish.description
    }
    
    func setup(order: OrderStruct){
        titleLabel.text = order.dish?.name
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        descriptionLabel.text = order.name
    }
    
}
