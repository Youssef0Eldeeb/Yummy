//
//  DishCategoryStruct.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 30/08/2022.
//

import Foundation


struct DishCategoryStruct: Codable{
    let id, name, image : String?
    
    enum CodingKeys: String, CodingKey{
        case id, image
        case name = "title"
        
    }
}
