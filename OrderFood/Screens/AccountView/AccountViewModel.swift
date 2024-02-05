//  AccountViewModel.swift
//  OrderFood
//  Created by Adam West on 19.01.2024.

import SwiftUI

final class AccountViewModel: ObservableObject {
    // MARK: Public Properties
    @AppStorage("user") private var userData: Data?
    @Published var user: User = User()
    @Published var alertItem: AlertItem?
    
    // MARK: Public methods
    func saveChanges() {
        guard isValidForm else {
            return
        }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData else {
            alertItem = AlertContext.unableToComplete
            return
        }
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            self.user = user
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}

// MARK: - Validation
extension AccountViewModel {
    var isValidForm: Bool {
        guard
            user.firstName.isNotEmpty &&
            user.lastName.isNotEmpty &&
            user.email.isNotEmpty
        else {
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
}
