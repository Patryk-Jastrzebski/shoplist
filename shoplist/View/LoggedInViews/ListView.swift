

import SwiftUI

struct ListView: View {
    @State private var productName: String = ""
    @State private var priceValue = ""
    @State private var selection = "Need"
    
    let filterOptions: [String] = [
        "Need", "Done"
    ]
    init() {
        //UISegmentedControl.appearance().selectedSegmentTintColor = .black
        //UITableView.appearance().backgroundColor = UIColor(Color("tableColor"))
        
    }
    @EnvironmentObject private var viewModel: ListViewModel
    var body: some View {
        VStack {
            VStack {
                Picker(
                    selection: $selection,
                    label: Text("picker"),
                    content: {
                        ForEach(filterOptions.indices) { index in
                            Text(filterOptions[index])
                                .tag(filterOptions[index])
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                HStack {
                    Text("All products")
                    Spacer()
                    Text("Price: \(finalPrice(), specifier: "%.2f") PLN")
                        .fontWeight(.medium)
                }
                .font(.headline)
                .padding(.trailing, 20)
                .padding(.leading, 20)
            }
            .padding(.bottom, 5)
            .background(Color("tableCellColor"))
            .cornerRadius(10)
            List {
                ForEach(viewModel.products.filter {selection == "Need" ? $0.bought == false : $0.bought == true}, id: \.id) {product in
                    ListRowView(product: product)
                        .padding()
                        .background(Color("tableCellColor"))
                        .cornerRadius(10)
                        .swipeActions(edge: .leading) {
                            Button {
                                if product.bought == false {
                                    viewModel.update(id: product.id, bought: true)
                                } else {
                                    viewModel.update(id: product.id, bought: false)
                                }
                            } label: {
                                Label("Done \(product.id)", systemImage: "checkmark.circle")
                            }.tint(.green)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                withAnimation(.spring()) {
                                    viewModel.remove(id: product.id) }
                            } label: {
                                Label("Delete \(product.id)", systemImage: "trash.circle")
                            }.tint(.red)
                        }
                }
                .listRowSeparator(.hidden)
                .padding(.trailing, -5)
                .padding(.leading, -5)
            }
            .task {viewModel.initListener()}
        }
    }
    private func finalPrice() -> Double {
        var summary = 0.0
        var i = 0
        for _ in viewModel.products {
            if viewModel.products[i].bought == true {continue}
            summary = viewModel.products[i].price + summary
            i += 1
        }
        return summary
    }
    private func deleteRow(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let rowId = viewModel.products[index].id
        viewModel.remove(id: rowId)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
