//
//  PopularDishStruct.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 31/08/2022.
//

import Foundation

struct DishStruct: Codable{
    let id, name, description, image: String?
    let calories: Int?
 
    var formattedCalories: String{
        return "\(calories ?? 0) Calories"
    }
}
