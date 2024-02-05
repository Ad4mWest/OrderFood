//
//  User.swift
//  Appetizers
//
//  Created by Sean Allen on 11/19/20.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
