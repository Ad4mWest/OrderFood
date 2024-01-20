//  AccountView.swift
//  Cards
//  Created by Adam West on 11.01.2024.

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First name", text: $viewModel.user.firstName)
                    TextField("Last name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.dateBirth,
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
                    .toggleStyle(SwitchToggleStyle(tint: .brandP))
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
