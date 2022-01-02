//
//  FaseView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct FaseView: View {

    @ObservedObject var viewModel: FaseViewModel
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    List(viewModel.fase, id: \.name) { name, fase in
                        NavigationLink(
                            fase ?? "",
                            destination: YearView(
                                viewModel: YearViewModel(
                                    faseIndex: name
                                )
                            )
                        )
                    }
                    .navigationTitle("A Voz")
                }
            }
            .opacity(viewModel.loading ? 0 : 1)
            ProgressView()
                .ignoresSafeArea()
                .progressViewStyle(.circular)
                .opacity(viewModel.loading ? 1 : 0)
        }
        .onAppear {
            viewModel.loadPeriods()
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

struct FaseView_Previews: PreviewProvider {
    static var previews: some View {
        FaseView(viewModel: FaseViewModel())
    }
}
