

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
    
    func addProduct(product_name: String, price_value: Double, quantity_value: Int, bought: Bool, shop_name: String, product_category: String) {
        let userID: String? = Auth.auth().currentUser?.uid
        guard let autoId = ref.child(dbPath).child(userID!).childByAutoId().key else {
            return
        }
        let product = Product(id: autoId, name: product_name, price: price_value, quantity: quantity_value, bought: bought, shopName: shop_name, category: product_category)
        
        do {
            try ref.child("\(dbPath)/\(userID!)/\(product.id)")
                .setValue(from: product)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    func remove(id: String) {
        let userID: String? = Auth.auth().currentUser?.uid
        ref.child("\(dbPath)/\(userID!)/\(id)").setValue(nil)
    }
    func update(id: String, bought: Bool) {
        let userID: String? = Auth.auth().currentUser?.uid
        ref.child("\(dbPath)/\(userID!)/\(id)")
            .updateChildValues([
                "bought": bought
            ])
    }
}
