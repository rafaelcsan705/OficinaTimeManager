//
//  ClientView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 11/10/2024.
//

import SwiftUI
import FirebaseFirestore

struct ClientView: View {
    @StateObject var clientViewModel = ClientViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(clientViewModel.clients) { client in
                    NavigationLink(destination: ClientDetailView(client: client)) {
                        ClientCardView(client: client)
                    }
                    .padding(.vertical, 8)
                }
                .navigationTitle("Clientes")
                
                NavigationLink(destination: CreateClientView(clientViewModel: clientViewModel)) {
                    Text("Novo Cliente")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .shadow(color: .gray, radius: 10, y: 2)
            }
        }
        .onAppear {
            clientViewModel.fetchClients()
        }
    }
}

#Preview {
    ClientView()
}
