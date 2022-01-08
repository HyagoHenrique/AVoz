//
//  AboutView.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import SwiftUI
import MobileCoreServices
import AlertToast

struct AboutView: View {
    
    @State var textPhone1: String = "(62) 3332-1559"
    @State var textPhone2: String = "(62) 99943-6200"
    @State var showToast: Bool =  false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color(UIColor.systemGray6)
                ScrollView {
                    VStack {
                        Image("AVOZ")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                        Text("Conectando passado, presente e futuro!")
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
                        
                        // swiftlint:disable line_length
                        Text("No dia 3 de outubro de 1997, uma sexta-feira, durante a realização do evento Reencontro com a Arte, promovido pela Sociedade Bonfinense de Cultura, no Espaço Cultural Juvenal Tavares, era lançada a primeira edição do Jornal A Voz. \n\nO jornal nascia com um compromisso com a História – registrar algo do cotidiano de nossa cidade com vistas ao presente e ao futuro. Desde então, já se passaram mais de 20 anos e chegamos à 210ª edição (tivemos uma paralisação de mais ou menos três anos).")
                            .font(.system(size: 16, weight: .medium))
                            .padding(.top)
                            .multilineTextAlignment(.center)
                        Text("Contatos")
                            .font(.system(size: 32, weight: .bold))
                            .padding(.top)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
                        Text("WhatsApp: \(textPhone1)")
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.center)
                            .onTapGesture(count: 2) {
                                UIPasteboard.general.setValue(textPhone1, forPasteboardType: kUTTypePlainText as String)
                                showToast.toggle()
                            }
                        Text("Telefone: \(textPhone2)")
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.center)
                            .onTapGesture(count: 2) {
                                UIPasteboard.general.setValue(textPhone2, forPasteboardType: kUTTypePlainText as String)
                                showToast.toggle()
                                
                            }
                        Text("E-mail:   contato@avozweb.com.br")
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.center)
                        Text("Endereço")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
                            .font(.system(size: 32, weight: .bold))
                            .padding(.top)
                        Text("Rua: Ivo de Paiva Lenza \nQD. 11, LT. 29, Setor Sul \nCEP: 75180-000 \nSilvânia – Goiás")
                            .font(.system(size: 16, weight: .medium))
                            .multilineTextAlignment(.center)
                        // swiftlint:enable line_length
                    }
                    .padding()
                }
            }
            .navigationTitle("Sobre")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toast(isPresenting: $showToast, duration: 2, tapToDismiss: true, alert: {
            AlertToast(
                displayMode: .hud,
                type: .regular, title: "Número Copiado!",
                style: .style(
                    backgroundColor: .black,
                              titleColor: .white
                )
            )
        })
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
