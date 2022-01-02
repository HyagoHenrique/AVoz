//
//  YearViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import FirebaseFirestore
import Foundation

final class YearViewModel: ObservableObject {
    var faseIndex: String?
    @Published var loading: Bool = false
    @Published var showError: Bool = false
    @Published var showMonth: Bool = false
    @Published var years: [String?] = []
    private let database = Firestore.firestore()
    init (faseIndex: String) {
        self.faseIndex = faseIndex
    }
    func loadYears() {
        self.loading = true
        database.collection("collection/\(faseIndex ?? "")/years/").getDocuments { (querySnapshot, error) in
            if let errorCall = error {
                print("Error getting documents: \(errorCall)")
                self.loading = false
                self.showError = true
            } else {
                for document in querySnapshot!.documents {
                    self.years.append(document.get("year") as? String)
                }
                self.loading = false
            }
        }
    }
    func destroyData() {
        self.years.removeAll()
    }
}
