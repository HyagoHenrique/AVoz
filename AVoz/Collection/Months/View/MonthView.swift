//
//  MonthView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct MonthView: View {
    @ObservedObject var viewModel: MonthViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(viewModel.newPaper, id:\.id) { news in
                    CardMonth(year: news.year ?? "" , month: news.month ?? "", edicao: news.edition ?? "")
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.loadNewsPaper()
        }
    }
}

private struct CardMonth: View {
    var year: String
    var month: String
    var edicao: String
    var body: some View {
        VStack {
            Text("\(edicao) - \(month) de \(year)")
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(viewModel: MonthViewModel(faseIndex: "", yearIndex: ""))
    }
}
