//
//  NavigationConfigurator.swift
//  AVoz
//
//  Created by Hyago Henrique on 04/01/22.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<NavigationConfigurator>
    ) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: UIViewControllerRepresentableContext<NavigationConfigurator>
    ) {
        if let navcontroller = uiViewController.navigationController {
            self.configure(navcontroller)
        }
    }

}
