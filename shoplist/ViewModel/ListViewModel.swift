//
//  ListViewModel.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 19/06/2022.
//

import Combine
import Firebase
import FirebaseDatabaseSwift

class ListViewModel: ObservableObject {
    @Published var products = [Product]()
    private let ref = Database.database(url: "https://shoplist-69271-default-rtdb.europe-west1.firebasedatabase.app").reference()
    private let dbPath = "products"
    
    init() {
        initListener()
    }
    
    func initListener() {
        let userID: String? = Auth.auth().currentUser?.uid
        if userID == nil { return }
        ref.child(dbPath).child(userID!).observe(.value) { snapshot in
            guard let children = snapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            self.products = children.compactMap { snapshot in
                return try? snapshot.data(as: Product.self)
            }
        }
    }
    
    func addProduct(product_name: String, price_value: Double) {
        let userID: String? = Auth.auth().currentUser?.uid
        guard let autoId = ref.child(dbPath).child(userID!).childByAutoId().key else {
            return
        }
        let product = Product(id: autoId, name: product_name, price: price_value)
        
        do {
            try ref.child("\(dbPath)/\(userID!)/\(product.id)")
                .setValue(from: product)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
