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
                    HStack {
                        Image("marilu")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 2))
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1)
                                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                                    .frame(height: 90)
                            VStack {
                                Text("Nome: Marilu")
                                Text("Função: Faz uns app fera")
                                Text("É filha da dona")
                            }
                        }
                    }
                    .padding()
                    HStack {
                        Image("amorzinho")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 2))
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1)
                                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                                    .frame(height: 90)
                            VStack {
                                Text("Nome: Renatinha")
                                Text("Função: briguenta e nervosa")
                                Text("É a filha mais velha da dona")
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Colaboradores")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct EditorsView_Previews: PreviewProvider {
    static var previews: some View {
        ContributorsView()
    }
}
