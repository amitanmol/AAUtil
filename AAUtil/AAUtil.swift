//
//  AAUtil.swift
//  AAUtil
//
//  Created by Amit Kumar Singh on 13/11/18.
//  Copyright © 2018 Amit Kumar Singh. All rights reserved.
//

import UIKit

class AAUtil {
    
    class func showAlert(title: String, message: String, controller: UIViewController) -> Void {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert top of all windows
        DispatchQueue.main.async(execute: {
            controller.present(alert, animated: true, completion: nil)
        })
    }

    class func isValidEmail(email: String) -> Bool {
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
    
    class func isValidPhone(number: String) -> Bool {
        // trim white spaces
        let phoneNumberTrimmedString = number.trimmingCharacters(in: .whitespaces)
        // set pattern
        let phoneNumberRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        // match string with pattern
        var valid = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex).evaluate(with: phoneNumberTrimmedString)
        if valid {
            valid = !number.contains("Invalid phone number")
        }
        return valid
    }
    
    class func printLog(message: String) -> Void {
        #if DEBUG
        print("\(message)")
        #endif
    }
    
    class func pathOfAppDocumentDirectory() -> String? {
        let allPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectoryPath: String = allPaths[0]
        return documentDirectoryPath
    }
    
    class func deviceToken(from tokenData: Data?) -> String? {
        var token = "\(String(describing: tokenData))"
        //Format token as you need:
        token = token.replacingOccurrences(of: " ", with: "")
        token = token.replacingOccurrences(of: ">", with: "")
        token = token.replacingOccurrences(of: "<", with: "")
        return token
    }
}
