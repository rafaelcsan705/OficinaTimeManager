//
//  NewJobView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 21/10/2024.
//

import SwiftUI
import FirebaseFirestore

struct NewJobView: View {
    @ObservedObject var viewModel = NewJobViewModel()
    @ObservedObject var clientsViewModel: ClientViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Picker("Cliente", selection: $viewModel.job.clientId) {
                            ForEach(clientsViewModel.clients, id: \.self) { client in
                                Text(client.name).tag(client.id ?? 0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        
                        Section {
                            TextField("Descrição", text: $viewModel.job.description)
                        }
                    }
                }
                Spacer()
                
                Button(action: { addJob() }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .shadow(color: .gray, radius: 10, y: 2)            }
        }
        .navigationTitle("Novo Trabalho")
        .onAppear {
            clientsViewModel.fetchClients()
        }
    }
    
    func addJob() {
        viewModel.addJob()
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NewJobView(clientsViewModel: ClientViewModel())
}
