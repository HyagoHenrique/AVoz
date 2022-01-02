//
//  MonthViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import Foundation
import FirebaseFirestore

final class MonthViewModel: ObservableObject {
    @Published var month = [ "oi", "mes", "garai"]
    private var yearSelected: String?
    init(year: String) {
        self.yearSelected = year
    }
    func getNewspaperByMonth(with month: String) { print(month) }
    func loadNewspaperByYear() { print(yearSelected ?? "") }
}
