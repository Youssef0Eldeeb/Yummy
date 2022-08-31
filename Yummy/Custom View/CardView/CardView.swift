//
//  CardView.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 31/08/2022.
//

import UIKit

class CardView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.15
        cornerRadius = 10
    }
}
