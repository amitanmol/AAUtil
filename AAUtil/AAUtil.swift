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

}
