//
//  AccountView.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/17/24.
//

import SwiftUI

struct AccountView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var birthday = Date()
    @State var extraNapkinsIsOn = false
    @State var frequntRefills = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Group {
                        TextField("First Name", text: $firstName)
                        
                        TextField("Last Name", text: $lastName)
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                    }
                    .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                    
                    Button(action: {
                        print("Tapped Save Changes")
                    }, label: {
                        Text("Save Changes")
                    })
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $extraNapkinsIsOn)
                    Toggle("Frequest Refills", isOn: $frequntRefills)
                } header: {
                    Text("Requests")
                }
            }
            .tint(.brandPrimary)
            .navigationTitle("🥸 Account")
        }
    }
}

#Preview {
    AccountView()
}
