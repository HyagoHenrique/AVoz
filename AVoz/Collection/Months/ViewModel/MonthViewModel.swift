//
//  MonthViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import Foundation
import FirebaseFirestore

final class MonthViewModel: ObservableObject {
    @Published var month: [Month] = [
        Month(title: "001", image: "cart", date: "Dezembro"),
        Month(title: "002", image: "bag", date: "Janeiro"),
        Month(title: "003", image: "circle.fill", date: "Fevereiro")
    ]
    private var yearSelected: String?
    init(year: String) {
        self.yearSelected = year
    }
    func getNewspaperByMonth(with month: String) {
        print(month)
    }
    func loadNewspaperByYear() {
        print(yearSelected ?? "")
    }
}
