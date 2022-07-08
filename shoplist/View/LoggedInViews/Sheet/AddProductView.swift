
import SwiftUI

struct AddProductView: View {
    @State private var productName: String = ""
    @State private var productPrice: String = ""
    @State private var productQuantity: String = ""
    @State private var productQuantityValue: Int = 1
    
    @EnvironmentObject private var viewModel: ListViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("nazwa produktu")) {
                    
                    TextField(
                        "Podaj nazwę",
                        text: $productName
                    )
                }
                Section(header: Text("cena")) {
                    
                    TextField(
                        "Podaj cenę",
                        text: $productPrice
                    )
                }
                Section(header: Text("ilość")) {
                    Stepper(
                        String(productQuantityValue),
                    value: $productQuantityValue,
                    in: 0...20,
                    step: 1
                    )
                }
                
                Button(action: {
                    viewModel.addProduct(product_name: productName, price_value: Double(productPrice) ?? 0.0, quantity_value: productQuantityValue, bought: false, shop_name: "", product_category: "")
                    dismiss()
                }, label: {
                    Text("Dodaj")
                })
                .navigationBarTitle("Nowy produkt")
            }
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
