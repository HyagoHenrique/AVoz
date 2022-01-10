//
//  NewspaperView.swift
//  A Voz
//
//  Created by Hyago Henrique on 09/01/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewspaperView: View {
    @ObservedObject var viewModel: NewspaperViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(viewModel.years, id: \.self) { year in
                    VStack {
                        Text(year)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.newspaper) { newspaper in
                                if newspaper.year == year {
                                    CardNewspaper(
                                        month: newspaper.month ?? "",
                                        edicao: String(newspaper.edition ?? 0),
                                        image: newspaper.image ?? ""
                                    )
                                        .onTapGesture {
                                            viewModel.getPDFURL(with: newspaper.pdfURL ?? "")
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .opacity(viewModel.isLoading ? 0 : 1)
            ProgressView("Carregando...")
                .progressViewStyle(CircularProgressViewStyle(tint: Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1))))
                .opacity(viewModel.isLoading ? 1 : 0)
        }
        .navigationTitle("Jornais")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadData()
        }
        .onDisappear {
            viewModel.destroyData()
        }
    }
}

private struct CardNewspaper: View {
    var month: String
    var edicao: String
    var image: String
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string: image))
                .resizable()
                .frame(width: 150, height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
            Text("\(edicao)ª Edição - \(month)")
        }
    }
}

struct NewspaperView_Previews: PreviewProvider {
    static var previews: some View {
        NewspaperView(viewModel: NewspaperViewModel(phase: ""))
    }
}
