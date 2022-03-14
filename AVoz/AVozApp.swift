//
//  AVozApp.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI
import Firebase

@main
struct AVozApp: App {
    init() {
        FirebaseApp.configure()
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        let tintColor = UITabBarAppearance()
        tintColor.selectionIndicatorTintColor = #colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)
        UITabBar.appearance().standardAppearance = tintColor
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = .black
        UIScrollView.appearance().backgroundColor = UIColor.systemGray6
        UIWindow.appearance().overrideUserInterfaceStyle = .light
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
