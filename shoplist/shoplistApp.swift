
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
