//
//  NewsView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI
import ACarousel

struct NewsView: View {
    let array = ["JK","ultimaed","JK","ultimaed"]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("ultimaed")
                        .resizable()
                        .frame(height: 470)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)), lineWidth: 1))
                        .padding(.top, 5)
                    
                    ACarousel(
                        array,
                        id: \.self,headspace: 0,
                        sidesScaling: 0,
                        autoScroll: .active(10
                                           )) { item in
                                               Image(item)
                                                   .resizable()
                                                   .frame(height: 170)
                                                   .clipShape(Rectangle())
                                                   .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)), lineWidth: 1))
                                           }
                                           .frame(height: 170)
                                           .clipShape(Rectangle())
                                           .padding(.horizontal, -10)
                    
                    Text("EDIÇÕES ANTERIORES")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.top, 15)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)))
                    
                    HStack {
                        Spacer()
                        Image("ultimaed")
                            .resizable()
                            .frame(height: 180)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)), lineWidth: 1))
                        Spacer()
                        Image("ultimaed")
                            .resizable()
                            .frame(height: 180)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)), lineWidth: 1))
                        Spacer()
                        Image("ultimaed")
                            .resizable()
                            .frame(height: 180)
                            .clipShape(Rectangle())
                            .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0, green: 0.6156862745, blue: 0.8941176471, alpha: 1)), lineWidth: 1))
                        Spacer()
                    }
                }
                .padding()
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

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
