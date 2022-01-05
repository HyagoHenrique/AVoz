//
//  MonthViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import Foundation
import FirebaseFirestore

final class MonthViewModel: ObservableObject {
    @Published var loading: Bool = false
    @Published var showError: Bool = false
    @Published var newPaper: [NewsPaper] = []
    private var yearSelected: String?
    private var faseSelected: String?
    private let database = Firestore.firestore()
    init(faseIndex: String?, yearIndex: String?) {
        self.faseSelected = faseIndex
        self.yearSelected = yearIndex
    }
    // - MARK: - Methods
    func loadNewsPaper() {
        self.loading = true
        database.collection(
            "collection/\(faseSelected ?? "")/years/\(yearSelected ?? "")/newspaper/"
        ).getDocuments { (querySnapshot, error) in
            if let errorCall = error {
                print("Error getting documents: \(errorCall)")
                self.loading = false
                self.showError = true
            } else {
                for document in querySnapshot!.documents {
                    let id = document.documentID
                    let newspaper = document["newspaper"] as? String
                    let month = document["month"] as? String
                    let edition = document["edition"] as? String
                    let year = document["year"] as? String
                    let image = document["image"] as? String
                    self.newPaper.append(
                        NewsPaper(
                            id: id,
                            year: year,
                            edition: edition,
                            newspaper: newspaper,
                            month: month,
                            image: image
                        )
                    )
                }
                self.loading = false
            }
        }
    }
    func destroyData() {
        self.newPaper = []
    }
    func getNewsPaper(with id: String) {
        guard let PDFurl = URL(string: id) else { return self.showError = true }
        UIApplication.shared.open(PDFurl)
    }
}
