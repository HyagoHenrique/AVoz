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
    
    @ObservedObject var viewModel: AboutViewModel
    
    @State var showToast: Bool =  false
    @State var message: String = ""
    private let phone: String = "(62) 9 9943-6200"
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color(UIColor.systemGray6)
                ScrollView {
                    VStack {
                        Image("AVOZ")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        Text("Conectando passado, presente e futuro!")
                            .font(.system(size: 18, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
                        
                        // swiftlint:disable line_length
                        Text("No dia 3 de outubro de 1997, uma sexta-feira, durante a realização do evento Reencontro com a Arte, promovido pela Sociedade Bonfinense de Cultura, no Espaço Cultural Juvenal Tavares, era lançada a primeira edição do Jornal A Voz. \n\nO jornal nascia com um compromisso com a História – registrar algo do cotidiano de nossa cidade com vistas ao presente e ao futuro. Desde então, já se passaram mais de 20 anos e chegamos à 210ª edição (tivemos uma paralisação de mais ou menos três anos).")
                            .font(.system(size: 16, weight: .medium))
                            .padding(.top)
                            .multilineTextAlignment(.center)
                        Text("Fale com a redação")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6818885207, blue: 0.9160618186, alpha: 1)))
                        HStack {
                            Image("whatsapp")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    viewModel.launchWhatsapp()
                                }
                            Text("\(viewModel.whatsApp)")
                                .font(.system(size: 16, weight: .medium))
                                .multilineTextAlignment(.center)
                                .onTapGesture(count: 2) {
                                    UIPasteboard.general.setValue(viewModel.whatsApp, forPasteboardType: kUTTypePlainText as String)
                                    message = "Número Copiado"
                                    showToast.toggle()
                                }
                        }
                        HStack {
                            Image(systemName: "phone.fill")
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    viewModel.launchPhone()
                                }
                            Text("\(phone)")
                                .font(.system(size: 16, weight: .medium))
                                .multilineTextAlignment(.center)
                                .onTapGesture(count: 2) {
                                    UIPasteboard.general.setValue(phone, forPasteboardType: kUTTypePlainText as String)
                                    message = "Número Copiado"
                                    showToast.toggle()
                                    
                                }
                        }
                        HStack {
                            Image(systemName: "envelope.fill")
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    viewModel.launchEmail()
                                }
                            Text(verbatim: viewModel.email)
                                .font(.system(size: 16, weight: .medium))
                                .multilineTextAlignment(.center)
                                .onTapGesture(count: 2) {
                                    UIPasteboard.general.setValue(viewModel.email, forPasteboardType: kUTTypePlainText as String)
                                    message = "Email Copiado"
                                    showToast.toggle()
                                }
                        }
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
                type: .regular, title: message,
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
        AboutView(viewModel: AboutViewModel())
    }
}
