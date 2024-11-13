//
//  ClientViewModel.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 11/10/2024.
//

import SwiftUI

class ClientViewModel: ObservableObject {
    @Published var clients: [Client] = []
    
    init() {
        fetchClients()
    }
    
    func fetchClients() {
        FirebaseService.shared.fetchClients { clients in
            self.clients = clients ?? []
        }
    }
    
    func saveClient(client: Client) {
        FirebaseService.shared.saveClient(client)
        self.fetchClients()
    }
    
    func deleteClient(client: Client) {
        FirebaseService.shared.deleteClient((String(describing: client.id)))
        self.fetchClients()
    }
}
