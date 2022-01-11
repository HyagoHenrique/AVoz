//
//  NewspaperView.swift
//  A Voz
//
//  Created by Hyago Henrique on 09/01/22.
//

import SwiftUI
import AlertToast
import URLImage

struct NewspaperView: View {
    @ObservedObject var viewModel: NewspaperViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var message: String = "Erro ao carregar alguns elementos, por favor tente mais tarde!"
    
    var body: some View {
        VStack {
            if !viewModel.isLoading {
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
                                            .environmentObject(viewModel)
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
            } else {
                ProgressView("Carregando...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1))))
            }
        }
        .navigationTitle("Jornais")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadData()
        }
        .onDisappear {
            viewModel.destroyData()
        }
        .toast(isPresenting: $viewModel.showToast, duration: 2, tapToDismiss: true, alert: {
            AlertToast(
                displayMode: .banner(.slide),
                type: .error(.red), title: message,
                style: .style(
                    backgroundColor: .black,
                    titleColor: .white
                )
            )
        })
    }
}

private struct CardNewspaper: View {
    @EnvironmentObject var viewModel: NewspaperViewModel
    var month: String
    var edicao: String
    var image: String
    var body: some View {
        VStack {
            if let urlImage = URL(string: image) {
                URLImage(url: urlImage, inProgress: { _ in
                    Text("Carregando...")
                        .frame(width: 150, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
                }, failure: { _, _ in
                    Text("Erro: Imagem não carregada")
                        .frame(width: 150, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
                }, content: { image in
                    image
                        .resizable()
                        .frame(width: 150, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
                })
                Text("\(edicao)ª Edição - \(month)")
            } else {
                Text("Imagem não disponível.")
                    .frame(width: 150, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
            }
        }
    }
}

struct NewspaperView_Previews: PreviewProvider {
    static var previews: some View {
        NewspaperView(viewModel: NewspaperViewModel(phase: ""))
    }
}
