//
//  ResponseStruct.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 04/09/2022.
//

import Foundation

struct WelcomeHome: Codable {
    let status: Int?
    let message: String?
    let data: AllDishes?
}

struct WelcomeDishes: Codable {
    let status: Int?
    let message: String?
    let data: [DishStruct]?
}

struct WelcomeOrders: Codable {
    let status: Int?
    let message: String?
    let data: [OrderStruct]?
}
