//
//  AccountView.swift
//  Appetizers
//
//  Created by João Pedro on 29/09/2023.
//

import SwiftUI

struct AccountView: View {

    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextfield: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextfield, equals: .firstName)
                        .onSubmit { focusedTextfield = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextfield, equals: .lastName)
                        .onSubmit { focusedTextfield = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusedTextfield, equals: .email)
                        .onSubmit { focusedTextfield = nil }
                        .submitLabel(.continue)
                    
                    DatePicker("Birthdate",
                               selection: $viewModel.user.birthdate,
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            }
            .navigationTitle("👨 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard, content: {
                    Button("Dismiss") {
                        focusedTextfield = nil
                    }
                })
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .onAppear {
            viewModel.retriveUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
