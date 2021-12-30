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
        VStack {
            List(viewModel.years, id: \.self) { years in
                NavigationLink(years.description, destination: AboutView())
            }
            .navigationTitle("Anos")
        }
    }
}

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        YearView(viewModel: YearViewModel(yearIndex: 0))
    }
}
