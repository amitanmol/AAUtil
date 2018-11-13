//
//  AAUtil.swift
//  AAUtil
//
//  Created by Amit Kumar Singh on 13/11/18.
//  Copyright © 2018 Amit Kumar Singh. All rights reserved.
//

import UIKit

class AAUtil {
    
    static func showAlert(title: String, message: String, controller: UIViewController) -> Void {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert top of all windows
        DispatchQueue.main.async(execute: {
            controller.present(alert, animated: true, completion: nil)
        })
    }

    static func isValidEmail(email: String) -> Bool {
        // trim white spaces
        let emailTrimmedString = email.trimmingCharacters(in: .whitespaces)
        // set pattern
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        // match string with pattern
        var valid = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: emailTrimmedString)
        if valid {
            valid = !email.contains("Invalid email id")
        }
        return valid
    }
}
