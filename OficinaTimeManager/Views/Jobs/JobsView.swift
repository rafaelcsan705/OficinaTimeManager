//
//  JobsView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 21/10/2024.
//

import SwiftUI
import FirebaseFirestore

struct JobsView: View {
    @ObservedObject var viewModel = JobsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.jobs) { job in
                    NavigationLink(destination: JobDetailView(job: job)) {
                        JobCardView(viewModel: viewModel, job: job)
                    }
                    .padding(.vertical, 8)
                }
                .navigationTitle("Trabalhos")
                
                NavigationLink(destination: NewJobView(clientsViewModel: ClientViewModel())) {
                    Text("Novo Trabalho")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .shadow(color: .gray, radius: 10, y: 2)
            }
        }
        .onAppear {
            viewModel.fetchJobs()
        }
    }
}

#Preview {
    JobsView()
}
