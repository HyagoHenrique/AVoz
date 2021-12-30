//
//  HomeView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct HomeView: View {
    @State var barItemSelected: Int = 1
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray4
    }
    var body: some View {
        VStack {
            TabView(selection: $barItemSelected) {
                AboutView()
                    .tabItem {
                        Label("Sobre", systemImage: "info.circle.fill")
                    }
                    .tag(0)
                NewsView()
                    .tabItem {
                        Label("Notícias", systemImage: "newspaper.fill")
                    }
                    .tag(1)
                FaseView(viewModel: FaseViewModel())
                    .tabItem {
                        Label("Acervo", systemImage: "doc.on.doc.fill")
                    }
                    .tag(2)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
