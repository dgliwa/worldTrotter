//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Derek Gilwa on 5/9/16.
//  Copyright © 2016 gliwaderek.com. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func fahrenheitFieldChanged(textField: UITextField) {
        if let text = textField.text where !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
}
