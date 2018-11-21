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
    
    /*
     ^     #Match the beginning of the string
     [6-9] #Match a 6, 7, 8 or 9
     \\d   #Match a digit (0-9 and anything else that is a "digit" in the regex engine)
     {9}   #Repeat the previous "\d" 9 times (9 digits)
     $     #Match the end of the string
     */
    class func isValidPhone(number: String) -> Bool {
        // trim white spaces
        let phoneNumberTrimmedString = number.trimmingCharacters(in: .whitespaces)
        // set pattern
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        // match string with pattern
        var valid = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex).evaluate(with: phoneNumberTrimmedString)
        if valid {
            valid = !number.contains("Invalid phone number")
        }
        return valid
    }
    
    // password validation // https://stackoverflow.com/questions/27998409/email-phone-validation-in-swift
    class func isValidPassword(password: String) -> Bool {
        
        var returnValue = true
        let mobileRegEx =  "[A-Za-z0-9.-_@#$!%&*]{5,15}$"  // "^[A-Z0-9a-z.-_]{5}$"
        
        do {
            let regex = try NSRegularExpression(pattern: mobileRegEx)
            let nsString = password as NSString
            let results = regex.matches(in: password, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        }
        catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
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
    
    class func deviceToken(from tokenData: Data) -> String? {
        var token = tokenData.reduce("", {$0 + String(format: "%02X", $1)})
        //Format token as you need:
        token = token.replacingOccurrences(of: " ", with: "")
        token = token.replacingOccurrences(of: ">", with: "")
        token = token.replacingOccurrences(of: "<", with: "")
        return token
    }
}
