//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Derek Gilwa on 5/9/16.
//  Copyright © 2016 gliwaderek.com. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusValue()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let hour = currentHour
        if(hour < 6 || hour > 19) {
            view.backgroundColor = UIColor.darkGrayColor()
        }
    }
    
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        //TODO: disallow alphabetic characters using NSCharacterSet class (from a bluetooth keyboard or something)
        let existingTextHasDecimal = textField.text?.rangeOfString(".")
        let replacementTextHasDecimal = string.rangeOfString(".")
        
        if existingTextHasDecimal != nil && replacementTextHasDecimal != nil {
            return false
        }
        return true
    }
    
    func updateCelsiusValue() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    let currentHour: Int = {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        return calendar.component(NSCalendarUnit.Hour, fromDate: date)
        }()
}
