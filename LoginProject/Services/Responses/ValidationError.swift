//
//  ValidationError.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import Foundation

class ValidationError {
    
    var error: Bool
    var message: String
    
    init(error: Bool, message: String) {
        self.error = error
        self.message = message
    }
}
