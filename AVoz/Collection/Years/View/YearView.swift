//
//  YearView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct YearView: View {
   @ObservedObject var viewModel: YearViewModel
    var body: some View {
        ZStack {
            VStack {
                List(viewModel.years, id: \.self) { years in
                    NavigationLink(
                        years?.description ?? "",
                        destination: MonthView(
                            viewModel: MonthViewModel(
                                year: years?.description ?? ""
                            )
                        )
                    )
                }
                .navigationTitle("Anos")
            }.opacity(viewModel.loading ? 0 : 1)
            ProgressView()
                .ignoresSafeArea()
                .progressViewStyle(.circular)
                .opacity(viewModel.loading ? 1 : 0)
        }
        .onAppear {
            viewModel.loadYears()
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

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        YearView(viewModel: YearViewModel(faseIndex: ""))
    }
}
