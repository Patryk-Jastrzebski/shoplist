

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
        List {
            Text("Suma: \(finalPrice(isBought: true), specifier: "%.2f")")
                .font(.caption)
            ForEach(viewModel.products.filter {selection == "Need" ? $0.bought == false : $0.bought == true}, id: \.id) {product in
                ListRowView(product: product)
                    .swipeActions(edge: .leading) {
                        Button {
                            if product.bought == false {
                                viewModel.update(id: product.id, bought: true)
                            } else {
                                viewModel.update(id: product.id, bought: false)
                            }
                        } label: {
                            Label("Zrobione", systemImage: "checkmark.circle")
                        }.tint(.green)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            withAnimation(.spring()) {
                                viewModel.remove(id: product.id) }
                        } label: {
                            Label("Usuń", systemImage: "trash.circle")
                        }.tint(.red)
                    }
            }
            .listRowSeparator(.hidden)
        }.listStyle(InsetListStyle())
        .task {viewModel.initListener()}
        .navigationTitle("Lista zakupów")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                NavigationLink(destination: SettingsView(), label: {
                    Image(systemName: "gear")
                    .foregroundColor(.secondary)})
                NavigationLink(destination: ProfileView(), label: {
                    Image(systemName: "person")
                    .foregroundColor(.secondary)})
            }
        }
    }
    private func finalPrice(isBought: Bool) -> Double {
        var summary = 0.0
        var i = 0
        for _ in viewModel.products {
            if viewModel.products[i].bought == isBought {i+=1; continue;}
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
        ListView().environmentObject(ListViewModel())
    }
        
}
