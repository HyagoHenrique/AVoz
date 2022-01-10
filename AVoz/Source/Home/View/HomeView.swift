//
//  HomeView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct HomeView: View {
    @State var barItemSelected: Int = 1
    var body: some View {
            TabView(selection: $barItemSelected) {
                AboutView(viewModel: AboutViewModel())
                    .tabItem {
                        Label("Sobre", systemImage: "info.circle.fill")
                    }
                    .tag(0)
                NewsView()
                    .tabItem {
                        Label("Edição Online", systemImage: "newspaper.fill")
                    }
                    .tag(1)
                ContributorsView()
                    .tabItem {
                        Label("Colaboradores", systemImage: "person.3")
                    }
                    .tag(2)
                PhaseView(viewModel: PhaseViewModel())
                    .tabItem {
                        Label("Acervo", systemImage: "doc.on.doc.fill")
                    }
                    .tag(3)
            }
            .accentColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
