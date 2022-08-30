//
//  OnboardingCollectionViewCell.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 30/08/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    
    
    func setup(_ slide: OnboardingSlideStruct){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescription.text = slide.description
    }
    
}
