//
//  ListView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 20/06/2022.
//

import SwiftUI

struct ListView: View {
    @State private var productName: String = ""
    @State private var priceValue = ""
    @State private var selection = "to buy"
    
    let filterOptions: [String] = [
        "to buy", "bought"
    ]
    init() {
        UISegmentedControl.appearance().backgroundColor = UIColor(Color("yellow"))
        UITableViewCell.appearance().backgroundColor = .black
        UITableView.appearance().backgroundColor = UIColor(Color("tableColor"))
        
    }
    @EnvironmentObject private var viewModel: ListViewModel
    var body: some View {
        VStack {
            Picker(
                selection: $selection,
                label: Text("picker"),
                content: {
                    ForEach(filterOptions.indices) {index in
                        Text(filterOptions[index])
                            .tag(filterOptions[index])
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            HStack {
                Spacer()
                Button(action: {}, label: {
                    HStack {
                        Text("Add")
                        Image(systemName: "plus")
                    }
                    .padding(5)
                    .background(Color("yellow"))
                    .foregroundColor(Color.black)
                    .cornerRadius(3)
                    .padding(.trailing, 15)
                })
            }
            HStack {
                Text("Products")
                Text("(\(viewModel.products.count))").fontWeight(.semibold)
                Spacer()
                Text("Price: \(finalPrice(), specifier: "%.2f") PLN")
                    .fontWeight(.medium)
            }
            .font(.caption)
            .padding(.trailing, 20)
            .padding(.leading, 20)
            ScrollView {
                ForEach(viewModel.products, id: \.id) {product in
                    ListRowView(product: product)
                        .padding()
                        .background(Color("tableCellColor"))
                        .cornerRadius(10)
                }
                .padding(.trailing, 20)
                .padding(.leading, 20)
            }
            .task {viewModel.initListener()}
        }
    }
    private func finalPrice() -> Double {
        var summary = 0.0
        var i = 0
        for _ in viewModel.products {
            summary = viewModel.products[i].price + summary
            i += 1
        }
        return summary
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
