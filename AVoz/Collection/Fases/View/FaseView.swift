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
        VStack {
            NavigationView {
                List(viewModel.fase, id: \.self) { fase in
                    NavigationLink(
                        fase.description,
                        destination: YearView(viewModel: YearViewModel(yearIndex: fase.description))
                    )
                }
                .navigationTitle("A Voz")
            }
        }
    }
}

struct FaseView_Previews: PreviewProvider {
    static var previews: some View {
        FaseView(viewModel: FaseViewModel())
    }
}
