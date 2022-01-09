//
//  AboutViewModel.swift
//  A Voz
//
//  Created by Hyago Henrique on 09/01/22.
//

import Foundation
import UIKit

final class AboutViewModel: ObservableObject {
    @Published private(set) var whatsApp:String = "(62) 3332-1559"
    @Published private(set) var phone:String = "62999436200"
    @Published private(set) var email:String = "contato@avozweb.com.br"
    
    func launchWhatsapp() {
        if let wappURL = URL(string: "https://api.whatsapp.com/send?phone=556233321559") {
            UIApplication.shared.open(wappURL, options: [:], completionHandler: nil)
        }
    }
    
    func launchEmail() {
        if let mailURL = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(mailURL)
        }
    }
    
    func launchPhone() {
        if let phoneURL = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL)
        }
    }
}
