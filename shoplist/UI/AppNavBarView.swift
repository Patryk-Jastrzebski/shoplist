//
//  AppNavBarView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 20/06/2022.
//

import SwiftUI

struct AppNavBarView: View {
    
    let title: String
   //let subtitle: String?
    
    var body: some View {
        ZStack {
            HStack {
                titleSection.zIndex(1)
                Spacer().zIndex(1)
            Image("vegetables")
                    
                    .resizable()
                    
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                    .position(x: 60, y: 45)
                    .clipped(antialiased: true)
                    .frame(width: 130, height: 60, alignment: .center)
                    .padding(.bottom, -8.0)
            }
            
            
        }
        .accentColor(.white)
        .foregroundColor(.black)
        .font(.headline)
        .background(
            Color("yellow").ignoresSafeArea(edges: .top)
        )
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppNavBarView(title: "Home")
            Spacer()
        }
        
    }
}

extension AppNavBarView {
    private var titleSection: some View {
        HStack(spacing: 0) {
            ZStack {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            }
        }
    }
}
