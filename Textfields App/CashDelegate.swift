//
//  CashDelegate.swift
//  Textfields App
//
//  Created by Arunjot Singh on 1/11/16.
//  Copyright © 2016 Arunjot Singh. All rights reserved.
//

import Foundation
import UIKit

class cashTextfieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text! as NSString
        var newText = text.stringByReplacingCharactersInRange(range, withString: string)
        var newTextString = String(newText)
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var digitText = ""
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
            }
        }
        
        if let Pennies = Int(digitText) {
            
            newText = "$" + self.dollarString(Pennies) + "." + self.centString(Pennies)
        } else {
            
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text! .isEmpty{
            textField.text = "$0,00"
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    
    
    func dollarString(pennies: Int) -> String {
        return String(pennies/100)
    }
    
    
    
    func centString(pennies: Int) -> String {
        let cents = pennies % 100
        var centstring = String(cents)
        
        if cents < 10 {
            centstring = "0" + centstring
        }
        
        return centstring
    }
}


