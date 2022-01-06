//
//  MonthView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MonthView: View {
    @ObservedObject var viewModel: MonthViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 50) {
                    ForEach(viewModel.newPaper, id:\.id) { news in
                        CardMonth(
                            year: news.year ?? "",
                            month: news.month ?? "",
                            edicao: news.edition ?? "",
                            image: news.image ?? ""
                        )
                        .onTapGesture {
                            viewModel.getNewsPaper(with: news.newspaper ?? "")
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Jornais")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
            .opacity(viewModel.loading ? 0 : 1)
            ProgressView()
                .ignoresSafeArea()
                .progressViewStyle(.circular)
                .opacity(viewModel.loading ? 1 : 0)
        }
        .onAppear {
            viewModel.destroyData()
            viewModel.loadNewsPaper()
        }
        .onDisappear {
            viewModel.destroyData()
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(
                title: Text("Falha ao carregar conteúdo"),
                message: Text("Tente novamente mais tarde."),
                dismissButton: .cancel()
            )
        }
    }
}

private struct CardMonth: View {
    var year: String
    var month: String
    var edicao: String
    var image: String
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string: image))
                .resizable()
                .frame(width: 100, height: 130)
            Text("\(edicao)")
            Text("\(month) de \(year)")
        }
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView(viewModel: MonthViewModel(faseIndex: "", yearIndex: ""))
    }
}
