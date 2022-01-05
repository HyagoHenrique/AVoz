//
//  FaseViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import FirebaseFirestore
import SwiftUI

final class FaseViewModel: ObservableObject {
    @Published var fase: [(name: String, fase: String?)] = []
    @Published var loading: Bool = false
    @Published var showError: Bool = false
    private let database = Firestore.firestore()
    // - MARK: - Methods
    func loadPeriods() {
        self.loading = true
        database.collection("collection").getDocuments { (querySnapshot, error) in
            if let errorCall = error {
                print("Error getting documents: \(errorCall)")
                self.loading = false
                self.showError = true
            } else {
                for document in querySnapshot!.documents {
                    self.fase.append((name: document.documentID, fase: document.get("fase") as? String))
                }
                self.loading = false
            }
        }
    }
    func dismissError() {
        self.showError = false
    }
    func destroyData() {
        self.fase.removeAll()
    }
}
