//
//  Validator.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation

struct ValidationError: Error {
    var message: String?
    
    init(message: String) {
        self.message = message
    }
}

enum ValidationType {
    case requiredField(field: String)
    case validAgeRange(field: String)
}

protocol Validator {
    func validate(value: String) throws -> Void
}

class RequiredFieldValidator: Validator {
    
    private var fieldName: String
    
    init(fieldName: String) {
        self.fieldName = fieldName
    }
    
    func validate(value: String) throws -> Void {
        if value.isEmpty {
            throw ValidationError(message: "A selection is required for \(fieldName).")
        }
    }
    
    
}

class ValidAgeRangeValidator: Validator {
    
    private var fieldName: String
    
    init(fieldName: String) {
        self.fieldName = fieldName
    }
    
    func validate(value: String) throws {
        guard let intValue = Int(value) else {
            throw ValidationError(message: "\(fieldName) requires a valid whole number.")
        }
        
        if intValue < 0 || intValue > 150 {
            throw ValidationError(message: "\(fieldName) requires a number between 0 and 150.")
        }
    }
    
}
