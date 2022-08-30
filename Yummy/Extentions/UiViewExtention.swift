//
//  UiViewExtention.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 30/08/2022.
//

import Foundation
import UIKit


extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
        
    }
}
