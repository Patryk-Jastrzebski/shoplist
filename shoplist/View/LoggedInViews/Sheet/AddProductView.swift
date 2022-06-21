//
//  AddProductView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 21/06/2022.
//

import SwiftUI

struct AddProductView: View {
    @State private var productName: String = ""
    @State private var productPrice: String = ""
    @State private var productQuantity: String = ""
    
    @EnvironmentObject private var viewModel: ListViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(
                    "Product name",
                    text: $productName
                )
                    .padding(11)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                "" == "" ? Color.black.opacity(0.05) : Color(.gray).opacity(0.2)
                            )
                    }.textInputAutocapitalization(.never)
                    .padding()
                HStack {
                    TextField(
                        "Price                PLN",
                        text: $productPrice
                    )
                        .keyboardType(.decimalPad)
                        .padding(11)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    "" == "" ? Color.black.opacity(0.05) : Color(.gray).opacity(0.2)
                                )
                        }.textInputAutocapitalization(.never)
                    
                        .padding(.leading, 15)
                    
                    TextField(
                        "Quantity",
                        text: $productQuantity
                    )
                        .padding(11)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    "" == "" ? Color.black.opacity(0.05) : Color(.gray).opacity(0.2)
                                )
                        }.textInputAutocapitalization(.never)
                        .padding(.trailing, 15)
                    
                }
                Button(action: {
                    viewModel.addProduct(product_name: productName, price_value: Double(productPrice) ?? 0.0, quantity_value: productQuantity, bought: false)
                    dismiss()
                }, label: {
                    HStack{
                        //Image(systemName: "plus")
                        Text("Add 🛒")
                    }
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("yellow"))
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: Color("yellow"), radius: 7, x: 2, y: 2)
                    
                })
                .navigationBarTitle("Add something  ✏️")
                Spacer()
            }
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
