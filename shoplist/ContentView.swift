//
//  ContentView.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 03/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
        if logStatus {
            HomeView()
        } else {
            LoginView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
