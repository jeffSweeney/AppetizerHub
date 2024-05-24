//
//  AccountView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Group {
                        TextField("First Name", text: $viewModel.firstName)
                        
                        TextField("Last Name", text: $viewModel.lastName)
                        
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                    }
                    .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                    
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save Changes")
                    })
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkinsIsOn)
                    Toggle("Frequest Refills", isOn: $viewModel.frequntRefills)
                } header: {
                    Text("Requests")
                }
            }
            .tint(.brandPrimary)
            .navigationTitle("🥸 Account")
            .alert(viewModel.alertItem?.title ?? "Error",
                   isPresented: $viewModel.showAlert,
                   actions: { Button("OK") { viewModel.alertItem = nil } },
                   message: { viewModel.alertItem?.message ?? Text("Unexpected Error - Try Again.") }
            )
        }
    }
}

#Preview {
    AccountView()
}
