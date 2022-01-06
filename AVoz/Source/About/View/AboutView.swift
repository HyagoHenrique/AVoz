//
//  AboutView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color(UIColor.systemGray6)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("A Voz")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                        
                        Image(systemName: "cart")
                            .resizable()
                            .frame(height: 220)
                            .padding(.top)
                        // swiftlint:disable line_length
                        Text("No dia 3 de outubro de 1997, uma sexta-feira, durante a realização do evento Reencontro com a Arte, promovido pela Sociedade Bonfinense de Cultura, no Espaço Cultural Juvenal Tavares, era lançada a primeira edição do Jornal A Voz. \n\nO jornal nascia com um compromisso com a História – registrar algo do cotidiano de nossa cidade com vistas ao presente e ao futuro. Desde então, já se passaram mais de 20 anos e chegamos à 210ª edição (tivemos uma paralisação de mais ou menos três anos).")
                            .font(.system(size: 16, weight: .medium, design: .monospaced))
                            .padding(.top)
                        Text("Contatos")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .padding(.top)
                        Text("Fixo:    (62) 3332-1559 \nCelular: (62) 99943-6200 \nE-mail:   contato@avozweb.com.br")
                            .font(.system(size: 16, weight: .medium, design: .monospaced))
                        Text("Endereço")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .padding(.top)
                        Text("Rua: Ivo de Paiva Lenza \nComplemento: Qd 11 Lt 29 \nBairro: Setor Sul \nCEP: 75180-000 – Silvânia – Goiás")
                            .font(.system(size: 16, weight: .medium, design: .monospaced))
                        // swiftlint:enable line_length
                    }
                    .padding()
                }
            }
            .navigationTitle("Sobre")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
