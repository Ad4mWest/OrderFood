//  AccountView.swift
//  OrderFood
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct AccountView: View {
    // MARK: Public Properties
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    // MARK: FormTextField
    enum FormTextField {
        case firstName, lastName, email
    }
    
    // MARK: Lifecycle
    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("Personal Info")
                ) {
                    TextField(
                        "First name",
                        text: $viewModel.user.firstName
                    )
                    .focused($focusedTextField, equals: .firstName)
                    .onSubmit {
                        focusedTextField = .lastName
                    }
                    .submitLabel(.next)
                    TextField(
                        "Last name",
                        text: $viewModel.user.lastName
                    )
                    .focused($focusedTextField, equals: .lastName)
                    .onSubmit {
                        focusedTextField = .email
                    }
                    .submitLabel(.next)
                    TextField(
                        "Email",
                        text: $viewModel.user.email
                    )
                    .focused($focusedTextField, equals: .email)
                    .onSubmit {
                        focusedTextField = nil
                    }
                    .submitLabel(.continue)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.dateBirth,
                        in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                        displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }
                Section(
                    header: Text("Requests")
                ) {
                    Toggle(
                        "Extra Napkins",
                        isOn: $viewModel.user.extraNapkins
                    )
                    Toggle(
                        "Frequent Refills",
                        isOn: $viewModel.user.frequentRefills
                    )
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandP))
            }
            .navigationTitle("👹 Profile")
            .toolbar {
                ToolbarItemGroup(
                    placement: .keyboard) {
                        Button("Dismiss") {
                            focusedTextField = nil
                        }
                    }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) {
            Alert(
                title: $0.title,
                message: $0.message,
                dismissButton: $0.dismissButton
            )
        }
    }
}

#Preview {
    AccountView()
}
