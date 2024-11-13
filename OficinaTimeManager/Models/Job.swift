//
//  Job.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 11/10/2024.
//

import Foundation

struct Job: Identifiable {
    var id: UUID = UUID()
    var clientId: Int
    var description: String
    var startTime: Date? = nil
    var accumulatedTime: TimeInterval = 0
    var isActive: Bool = false
    
    func toDictionary() -> [String: Any] {
        return [
            "id": id.uuidString,
            "clientId": clientId,
            "description": description,
            "startTime": startTime?.timeIntervalSince1970 ?? NSNull(),
            "accumulatedTime": accumulatedTime,
            "isActive": isActive
        ]
    }
    
    static var mockJob: Job {
        return Job(clientId: 1, description: "Reparação de motor")
    }
    
    static var mockJobs: [Job] {
        return [
            Job(clientId: 1, description: "Reparação de motor"),
            Job(clientId: 2, description: "Reparação de direção"),
            Job(clientId: 3, description: "Reparação de bateria")
        ]
    }
}
