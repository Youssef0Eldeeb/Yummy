//
//  OrderStruct.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 01/09/2022.
//

import Foundation


struct OrderStruct: Codable{
    let id, name : String?
    let dish: DishStruct?
}
