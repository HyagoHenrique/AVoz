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
                ForEach(viewModel.month, id: \.self) { month in
                    CardMonth(image: month.image ?? "", date: month.date ?? "", edicao: month.title ?? "")
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.loadNewspaperByYear()
        }
    }
}

private struct CardMonth: View {
    var image: String
    var date: String
    var edicao: String
    var body: some View {
        VStack {
            Image(systemName: image)
            Text("\(edicao) - \(date)")
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(viewModel: MonthViewModel(year: ""))
    }
}
