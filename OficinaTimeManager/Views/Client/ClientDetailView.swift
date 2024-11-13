//
//  ClientDetailView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 21/10/2024.
//

import SwiftUI

struct ClientDetailView: View {
    var client: Client
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Nome: \(client.name)")
                .font(.title)
            Text("Morada: \(client.address)")
                .font(.title2)
            Text("Contacto: \(client.contact)")
                .font(.title3)
            Text("NIF: \(client.nif)")
            Text("Email: \(client.email)")
        }
        .padding()
        .navigationTitle("Detalhes do Cliente")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ClientDetailView(client: Client.mockClient)
}
