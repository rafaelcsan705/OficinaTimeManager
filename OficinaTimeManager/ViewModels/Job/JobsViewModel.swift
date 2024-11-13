//
//  JobsViewModel.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 21/10/2024.
//

import SwiftUI

class JobsViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    
    func startJob(for job: Job) {
        guard let index = jobs.firstIndex(where: { $0.id == job.id }) else { return }
        jobs[index].startTime = Date()
        jobs[index].isActive = true
        saveJob(jobs[index])
    }
    
    func stopJob(for job: Job) {
        guard let index = jobs.firstIndex(where: { $0.id == job.id }), let startTime = jobs[index].startTime else { return }
        let elapsed = Date().timeIntervalSince(startTime)
        jobs[index].accumulatedTime += elapsed
        jobs[index].isActive = false
        jobs[index].startTime = nil
        saveJob(jobs[index])
    }
    
    func saveJob(_ job: Job) {
        FirebaseService.shared.saveJob(job)
        self.fetchJobs()
    }
    
    func fetchJobs() {
        FirebaseService.shared.fetchJobs { jobs in
            guard let jobsList = jobs else { return }
            self.jobs = jobsList
        }
    }
}
