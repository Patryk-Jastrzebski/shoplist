

import Foundation

struct Product: Identifiable, Codable {
    var id: String
    var name: String
    var price: Double
    var quantity: Int
    var bought: Bool
    var shopName: String
    var category: String
}
