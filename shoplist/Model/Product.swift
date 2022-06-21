//
//  Product.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 20/06/2022.
//

import Foundation

struct Product: Identifiable, Codable {
    var id: String
    var name: String
    var price: Double
    var quantity: String
    var bought: Bool
}
