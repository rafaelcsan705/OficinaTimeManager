//
//  ClientCardView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 21/10/2024.
//

import SwiftUI

struct ClientCardView: View {
    var client: Client
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(client.name)
                    .font(.headline)
                Text(client.address)
                    .font(.subheadline)
                Text(client.contact)
                    .font(.subheadline)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

#Preview {
    ClientCardView(client: Client.mockClient)
}
