//
//  FaseView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct PhaseView: View {
    @ObservedObject var viewModel: PhaseViewModel
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    List(viewModel.fase, id: \.name) { name, fase in
                        NavigationLink(
                            name,
                            destination: NewspaperView(viewModel: NewspaperViewModel(phase: fase))
                        )
                    }
                    .navigationTitle("Períodos")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct PhaseView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseView(viewModel: PhaseViewModel())
    }
}
