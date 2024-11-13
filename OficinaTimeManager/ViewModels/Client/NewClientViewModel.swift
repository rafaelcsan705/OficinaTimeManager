//
//  NewClientViewModel.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 12/10/2024.
//

import SwiftUI

class NewClientViewModel: ObservableObject {
    @Published var client: Client = Client(id: 0, name: "", address: "", contact: "", nif: "", email: "")
    @Published var workType: String = ""
    @Published var date: Date = Date()
    
    // Lista de tipos de trabalho
    let workTypes = ["Reparação", "Manutenção", "Instalação"]
    
    func saveClient() {
        FirebaseService.shared.saveClient(client)
    }
}
