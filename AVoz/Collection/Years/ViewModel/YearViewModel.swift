//
//  YearViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import Foundation

final class YearViewModel: ObservableObject {
    var yearIndex: Int? = 0
    @Published var years: [String] = ["Ano 1", "Ano 2", "Ano 3", "Ano 4", "Ano 5", "Ano 6", "Ano 7", "Ano 8"]
    init (yearIndex: Int) {
        self.yearIndex = yearIndex
    }
}
