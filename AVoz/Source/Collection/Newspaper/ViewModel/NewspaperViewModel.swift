//
//  NewspaperViewModel.swift
//  A Voz
//
//  Created by Hyago Henrique on 09/01/22.
//

import Foundation
import FirebaseFirestore

final class NewspaperViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true
    private var database = Firestore.firestore()
    var phase: String
    var newspaper: [Newspaper] = []
    private var yearsSet: Set<String> = []
    var years: [String] = []
    
    init(phase: String) {
        self.phase = phase
    }
    
    func loadData() {
        database.collection(phase).order(by: "edition").addSnapshotListener { (querySnapshot, error) in
            if let hasError = error {
                print(hasError)
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
    }
    
    func getPDFURL(with pdfURL: String) {
        
    }
}
