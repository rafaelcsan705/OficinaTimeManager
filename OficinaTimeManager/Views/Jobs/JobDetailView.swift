//
//  JobDetailView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 21/10/2024.
//

import SwiftUI

struct JobDetailView: View {
    let job: Job
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Cliente ID: \(job.clientId)")
                .font(.headline)
            
            Text("Descrição: \(job.description)")
                .font(.subheadline)
            
            Text("Tempo Estimado: \(job.accumulatedTime, specifier: "%.2f") horas")
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalhes do Trabalho")
    }
}

#Preview {
    JobDetailView(job: Job.mockJob)
}
