//
//  ListRowView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 19/06/2022.
//

import SwiftUI

struct ListRowView: View {

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Kategoria")
                        Text("|")
                        Text("Utworzono 20.09")
                    }.font(.system(size: 16.0, weight: .medium, design: .rounded))
                        .padding(.bottom, 1)
                    Text("10 produktów")
                        .font(.system(size:14.0, weight: .bold, design: .rounded))
                }
                Spacer()
                Image(systemName: "arrow.forward")
                    .font(.system(size: 26.0, weight: .bold, design: .rounded))
            }
        }
    }
}
