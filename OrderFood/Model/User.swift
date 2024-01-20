//  User.swift
//  OrderFood
//  Created by Adam West on 19.01.2024.

import Foundation

struct User: Codable {
    var firstName: String = String()
    var lastName: String = String()
    var email: String = String()
    var dateBirth: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
