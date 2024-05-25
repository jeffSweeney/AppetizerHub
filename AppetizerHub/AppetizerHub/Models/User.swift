//
//  User.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/25/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkinsIsOn = false
    var frequntRefills = false
}
