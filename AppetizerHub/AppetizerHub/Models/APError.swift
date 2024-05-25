//
//  APError.swift
//  AppetizerHub
//
//  Created by Jeffrey Sweeney on 5/18/24.
//

import Foundation

enum APError: Error {
    case emptyTextField
    case invalidData
    case invalidEmailFormat
    case invalidResponse
    case invalidUrl
    case unableToComplete
    case userEncodingFailure
}
