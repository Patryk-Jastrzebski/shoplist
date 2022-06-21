//
//  ListRowView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 19/06/2022.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject private var viewModel: ListViewModel
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: product.bought ? "checkmark.circle" : "circle")
                        .font(.system(size: 20.0, weight: .medium, design: .rounded))
                        .foregroundColor(product.bought == false ? .blue : .green)
                })
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.name)
                        Text("|")
                        Text(product.quantity).foregroundColor(.secondary)
                    }.font(.system(size: 14.0, weight: .medium, design: .rounded))
                        .padding(.bottom, 1)
                    Text("\(product.price, specifier: "%.2f") zł")
                        .font(.system(size:12.0, weight: .bold, design: .rounded))
                }
                Spacer()
                Button(action: {
                }, label: {
                    Image(systemName: "trash.circle.fill")
                        .font(.system(size: 26.0, weight: .bold, design: .rounded))
                        .foregroundColor(Color.black.opacity(0.2))
                })
            }
        }.transition(.move(edge: .trailing))
    }
    //    var body: some View {
    //        VStack(alignment: .leading) {
    //            HStack {
    //                VStack(alignment: .leading) {
    //                    HStack {
    //                        Text("Kategoria")
    //                        Text("|")
    //                        Text("Utworzono 20.09")
    //                    }.font(.system(size: 16.0, weight: .medium, design: .rounded))
    //                        .padding(.bottom, 1)
    //                    Text("10 produktów")
    //                        .font(.system(size:14.0, weight: .bold, design: .rounded))
    //                }
    //                Spacer()
    //                Image(systemName: "arrow.forward")
    //                    .font(.system(size: 26.0, weight: .bold, design: .rounded))
    //            }
    //        }
    //    }
}
