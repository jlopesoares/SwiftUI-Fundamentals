//
//  APError.swift
//  Appetizers
//
//  Created by João Pedro Soares on 03/10/2023.
//

import Foundation

enum APError: Error {
    case invalidURL,
    invalidResponse,
    invalidData,
    unableToComplete
}
