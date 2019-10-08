//
//  UITextField+Validator.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    /// Method to make showing errors a little easier using a simple alert.
    ///
    /// - Parameters:
    ///   - type: The validation type that you are looking to validate against.
    func validateTextField(type: ValidationType) throws -> Void {
        switch type {
        case .requiredField(let fieldName):
            let validator = RequiredFieldValidator(fieldName: fieldName)
            return try validator.validate(value: self.text ?? "")
        case .validAgeRange(let fieldName):
            let validator = ValidAgeRangeValidator(fieldName: fieldName)
            return try validator.validate(value: self.text ?? "")
        }
        
    }
}
