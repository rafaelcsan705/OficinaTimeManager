//
//  NewJobViewModel.swift.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 11/10/2024.
//

import SwiftUI

class NewJobViewModel: ObservableObject {
    @Published var job: Job = Job(clientId: 0, description: "")
    
    func addJob() {
        FirebaseService.shared.saveJob(job)
    }
}
