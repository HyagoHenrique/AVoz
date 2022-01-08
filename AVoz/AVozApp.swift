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
        coloredNavAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        let tintColor = UITabBarAppearance()
        tintColor.selectionIndicatorTintColor = #colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)
        UITabBar.appearance().standardAppearance = tintColor
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = .black
        UIWindow.appearance().overrideUserInterfaceStyle = .light
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
