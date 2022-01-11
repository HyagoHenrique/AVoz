//
//  NewspaperViewModel.swift
//  A Voz
//
//  Created by Hyago Henrique on 09/01/22.
//

import Foundation
import FirebaseFirestore

final class NewspaperViewModel: ObservableObject {
    
    @Published var showToast: Bool = false
    @Published var isLoading: Bool = false
    @Published var message: String = ""
    private var database = Firestore.firestore()
    var phase: String
    var newspaper: [Newspaper] = []
    private var yearsSet: Set<String> = []
    var years: [String] = []
    
    init(phase: String) {
        self.phase = phase
    }
    
    func loadData() {
        isLoading = false
        database.collection(phase).order(by: "edition").addSnapshotListener { (querySnapshot, error) in
            if let hasError = error {
                print(hasError)
                self.message = "Erro ao carregar elementos, por favor tente mais tarde!"
                self.isLoading = false
                self.showToast = true
            }
            if let querySnapshot = querySnapshot {
                self.newspaper = querySnapshot.documents.compactMap { document -> Newspaper? in
                    try? document.data(as: Newspaper.self)
                }
                self.newspaper.forEach { newspaper in
                    self.yearsSet.insert(newspaper.year ?? "")
                }
                self.yearsSet.forEach { item in
                    self.years.append(item)
                }
                self.isLoading = false
            }
        }
    }
    
    func destroyData() {
        newspaper.removeAll()
        yearsSet.removeAll()
        years.removeAll()
        message = ""
    }
    
    func getPDFURL(with pdfURL: String) {
        guard let urlPDF = URL(string: pdfURL) else {
            self.message = "Erro ao abrir pdf, por favor tente mais tarde."
            self.showToast = true
            return
        }
        UIApplication.shared.open(urlPDF)
    }
}
