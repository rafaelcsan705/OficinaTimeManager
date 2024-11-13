//
//  JobCardView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 21/10/2024.
//

import SwiftUI

struct JobCardView: View {
    @ObservedObject var viewModel: JobsViewModel
    let job: Job
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(job.description)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(job.clientId.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Tempo: \(job.accumulatedTime, specifier: "%.2f") horas")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            buttonWithImage(systemName: job.isActive ? "stop.fill" : "play.fill", color: job.isActive ? .red : .blue, isActive: job.isActive)
        }
    }
    
    func buttonWithImage(systemName: String, color: Color, isActive: Bool) -> some View {
        Button(action: {
            if isActive {
                viewModel.stopJob(for: job)
            } else {
                viewModel.startJob(for: job)
            }
        }) {
            Image(systemName: systemName)
                .foregroundColor(color)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(8)
    }
}

#Preview {
    JobCardView(viewModel: JobsViewModel(), job: Job.mockJob)
}
