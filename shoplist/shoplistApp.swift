//
//  shoplistApp.swift
//  shoplist
//
//  Created by Patryk Jastrzębski on 03/06/2022.
//

import SwiftUI
import Firebase

@main
struct shoplistApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ListViewModel())
        }
    }
}
