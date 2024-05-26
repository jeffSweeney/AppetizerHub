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
                        TextField("First Name", text: $viewModel.user.firstName)
                        
                        TextField("Last Name", text: $viewModel.user.lastName)
                        
                        TextField("Email", text: $viewModel.user.email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                    }
                    .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save Changes")
                    })
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkinsIsOn)
                    Toggle("Frequest Refills", isOn: $viewModel.user.frequntRefillsIsOn)
                } header: {
                    Text("Requests")
                }
                
                if !viewModel.user.orders.isEmpty {
                    Section {
                        ForEach(viewModel.user.orders.reversed()) { order in
                            PastOrderCell(order: order)
                        }
                    } header: {
                        Text("Past Orders")
                    }
                }
            }
            .tint(.brandPrimary)
            .navigationTitle("🥸 Account")
            .onAppear { viewModel.retrieveUser() }
            .alert(viewModel.alertItem?.title ?? "Error",
                   isPresented: $viewModel.showAlert,
                   actions: { Button("OK") { viewModel.alertItem = nil } },
                   message: { viewModel.alertItem?.message ?? Text("Unexpected Error - Try Again.") }
            )
        }
    }
}

#Preview {
    AccountView(viewModel: MockData.accountViewModel)
}
