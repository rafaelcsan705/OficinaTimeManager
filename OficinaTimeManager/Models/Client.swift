//
//  Client.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 11/10/2024.
//

import Foundation

struct Client: Identifiable, Hashable {
    var id: Int?
    var name: String
    var address: String
    var contact: String
    var nif: String
    var email: String
    
    // Adicionando conformidade a Hashable (opcional se usar Swift 5.1 ou posterior)
    static func == (lhs: Client, rhs: Client) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "address": address,
            "contact": contact,
            "nif": nif,
            "email": email
        ]
    }
    
    static var mockClient: Client {
        return Client(id: 1, name: "Rafael Santos", address: "Rua do Rafael", contact: "912345678", nif: "123456789", email: "teste_email@teste.com")
    }
    
    static var mockClientS: [Client] {
        return [
            Client(id: 0, name: "Rafael Santos", address: "Rua do Rafael", contact: "912345678", nif: "123456789", email: "teste_rafael@teste.com"),
            Client(id: 1, name: "Sofia Santos", address: "Rua da Sofia", contact: "912345678", nif: "123456789", email: "teste_sofia@teste.com"),
            Client(id: 2, name: "Fábio Santos", address: "Rua do Fábio", contact: "912345678", nif: "123456789", email: "teste_fábio@teste.com")
        ]
    }
}
