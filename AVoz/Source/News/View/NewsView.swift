//
//  NewsView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack {
                        Image("JK")
                        .resizable()
                        .frame(height: 170)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
                        
                        Text("Última Edição")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.top, 30)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
                        
                        Image("ultimaed")
                        .resizable()
                        .frame(height: 470)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
                        
                        Text("Outras Edição")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.top, 15)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
                        
                        HStack {
                            Image("ultimaed")
                            .resizable()
                            .frame(width: 160, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
                            Spacer()
                            Image("ultimaed")
                            .resizable()
                            .frame(width: 160, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)), lineWidth: 1))
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                }
            }
            .navigationTitle("A Voz")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
