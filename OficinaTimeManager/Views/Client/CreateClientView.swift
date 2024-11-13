//
//  CreateClientView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 12/10/2024.
//

import SwiftUI

struct CreateClientView: View {
    @ObservedObject var viewModel = NewClientViewModel()
    @ObservedObject var clientViewModel: ClientViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Nome", text: $viewModel.client.name)
                            .autocapitalization(.words)
                        
                        TextField("Morada", text: $viewModel.client.address)
                            .autocapitalization(.words)
                        
                        TextField("NIF", text: $viewModel.client.nif)
                            .keyboardType(.numberPad)
                            .autocapitalization(.words)
                        
                        TextField("Contacto", text: $viewModel.client.contact)
                            .keyboardType(.phonePad)
                            .autocapitalization(.words)
                        
                        TextField("Email", text: $viewModel.client.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.words)
                    }
                    
                    Section(header: Text("Tipo de Trabalho")) {
                        Picker("Tipo de Trabalho", selection: $viewModel.workType) {
                            ForEach(viewModel.workTypes, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                }
                Spacer()
                
                Button(action: { saveClient() }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .shadow(color: .gray, radius: 10, y: 2)
            }
            .navigationTitle("New Client")
        }
        .onAppear {
            viewModel.client.id = clientViewModel.clients.count
        }
    }
    
    func saveClient() {
        viewModel.saveClient()
        clientViewModel.fetchClients()
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    CreateClientView(clientViewModel: ClientViewModel())
}
