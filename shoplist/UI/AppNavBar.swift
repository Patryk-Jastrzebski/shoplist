

import SwiftUI

struct test: View {
    
    let test: String
    
    var body: some View {
        Text(test)
    }
}


struct AppNavBarView: View {
    
    let title: String
    let page: String
    let button: AnyView
    //let subtitle: String?
    
    var body: some View {
        ZStack {
            HStack {
                titleSection
                Spacer()
                if page == "house" {
                    button
                }
            }
            .foregroundColor(.black)
            .font(.headline)
            .background(
                Color("yellow").ignoresSafeArea(edges: .top)
            )
        }
    }
}

//struct AppNavBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            AppNavBarView(title: "Home", page: "house", add: )
//            Spacer()
//        }
//
//    }
//}

extension AppNavBarView {
    private var titleSection: some View {
        HStack(spacing: 0) {
            ZStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.leading, 10)
                    .padding(.bottom, 20)
            }
        }
    }
    private var addButton: some View {
        HStack(spacing: 0) {
            ZStack {
                Circle()
                    .fill(.black)
                    .frame(width: 30, height: 30)
                Image(systemName: "plus")
                    .font(.title3)
                    .foregroundColor(.white)
            }
        }.padding()
    }
}

