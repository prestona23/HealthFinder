//
//  UIViewController+ShowAlert.swift
//  HealthFinder
//
//  Created by Aaron Preston on 10/7/19.
//  Copyright © 2019 Aaron Preston. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    /// Method to make showing errors a little easier using a simple alert.
    ///
    /// - Parameters:
    ///   - title: The title you want to use in the alert.
    ///   - message: An optional message for the alert.
    func showError(with title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
