//
//  AllDishes.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 04/09/2022.
//

import Foundation



struct AllDishes: Codable {
    let categories: [DishCategoryStruct]?
    let populars: [DishStruct]?
    let specials: [DishStruct]?
}
