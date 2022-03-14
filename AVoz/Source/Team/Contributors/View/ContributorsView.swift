//
//  ContributorsView.swift
//  A Voz
//
//  Created by Hyago Henrique on 09/01/22.
//

import SwiftUI

struct ContributorsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 10) {
                        HStack(alignment: .top) {
                            Image("marilu")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 2))
                                .padding(.vertical)
                                .padding(.leading, 10)
                            Spacer()
                            VStack {
                                Text("Maria Luísa")
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)))
                                    .padding(.top)
                                Text("24 anos, nascida em Silvânia, escreve sobre engenharia civil")
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.trailing, 10)
                            Spacer()
                        }
                        .background(Color(.white))
                        .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 2))
                        
                        HStack(alignment: .top) {
                            Image("amorzinho")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 2))
                                .padding(.vertical)
                                .padding(.leading, 10)
                            Spacer()
                            VStack {
                                Text("Renata Elisa")
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)))
                                    .padding(.top)
                                Text("26 anos, Biomédica, nascida em Silvânia, escreve sobre saúde")
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.trailing, 10)
                            Spacer()
                        }
                        .background(Color(.white))
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 2))
                        
                    }
                    .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("AVOZ")
                            .resizable()
                            .frame(width: 60, height: 25)
                    }
                }
            }
        }
    }
}

struct EditorsView_Previews: PreviewProvider {
    static var previews: some View {
        ContributorsView()
    }
}
