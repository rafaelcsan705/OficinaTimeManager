//
//  FirebaseService.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 22/10/2024.
//

import FirebaseFirestore

class FirebaseService {
    static let shared = FirebaseService()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func fetchClients(completion: @escaping ([Client]?) -> Void) {
        db.collection("clients").getDocuments { (snapshot, error) in
            if let error = error {
                print("Erro fetchClients: \(error)")
                completion([])
            }
            
            guard let documents = snapshot?.documents else {
                print("Erro fetchClients, no documents.")
                completion([])
                return
            }
            
            let clients = documents.map { queryDocumentSnapshot -> Client in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? Int ?? 0
                let name = data["name"] as? String ?? ""
                let address = data["address"] as? String ?? ""
                let contact = data["contact"] as? String ?? ""
                let nif = data["nif"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                
                return Client(id: id, name: name, address: address, contact: contact, nif: nif, email: email)
            }
            completion(clients)
        }
    }
    
    func saveClient(_ client: Client) {
        guard let id = client.id else { return print(" ❌ ❌ ❌ - Save Client miss Client ID") }
        let clientData = client.toDictionary()
        db.collection("clients").document("\(id)").setData(clientData) { error in
            print(" ❌ ❌ ❌ - Save Client Error: \(String(describing: error))")
        }
    }
    
    func deleteClient(_ clientId: String) {
        db.collection("clients").document(clientId).delete { error in
            print(" ❌ ❌ ❌ - Delete Client Error: \(String(describing: error))")
        }
    }
    
    func saveJob(_ job: Job) {
        let jobRef = db.collection("jobs").document("\(job.id)")
        let jobData: [String: Any] = [
            "id": job.id.uuidString,
            "clientId": job.clientId,
            "description": job.description,
            "isActive": job.isActive,
            "accumulatedTime": job.accumulatedTime,
            "startTime": job.startTime ?? Date()
        ]
        
        jobRef.setData(jobData, merge: true) { error in
            if let error = error {
                print(" ❌ ❌ ❌ - Save Job Error: \(error)")
            } else {
                print(" ✅ - Job saved/updated successfully.")
            }
        }
    }
    
    func fetchJobs(completion: @escaping ([Job]?) -> Void) {
        db.collection("jobs").getDocuments { (snapshot, error) in
            if let error = error {
                print(" ❌ ❌ ❌ - Fetch Jobs Error: \(error)")
                completion([])
                return
            }
            
            guard let documents = snapshot?.documents else {
                print(" ❌ ❌ ❌ - Fetch Jobs Error, no documents")
                completion([])
                return
            }
            
            let jobs = documents.compactMap { queryDocumentSnapshot -> Job? in
                let data = queryDocumentSnapshot.data()
                
                guard let idString = data["id"] as? String, let id = UUID(uuidString: idString) else { return nil }
                let clientId = data["clientId"] as? Int ?? 0
                let description = data["description"] as? String ?? ""
                let accumulatedTime = data["accumulatedTime"] as? TimeInterval ?? 0
                let isActive = data["isActive"] as? Bool ?? false
                
                let startTime: Date?
                if let timestamp = data["startTime"] as? Timestamp {
                    startTime = timestamp.dateValue()
                } else {
                    startTime = nil
                }
                
                
                return Job(id: id, clientId: clientId, description: description, startTime: startTime, accumulatedTime: accumulatedTime, isActive: isActive)
            }
            completion(jobs)
        }
    }
}
