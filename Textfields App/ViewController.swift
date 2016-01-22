//
//  ViewController.swift
//  Textfields App
//
//  Created by Arunjot Singh on 1/10/16.
//  Copyright © 2016 Arunjot Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    let zipCodeDelegate = ZipCodeTextfieldDelegate()
    let cashDelegate = cashTextfieldDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField1.delegate = self.zipCodeDelegate
        self.textField2.delegate = self.cashDelegate
        self.textField3.delegate = self
        textField3.enabled = false
        textField3.backgroundColor = UIColor.lightGrayColor()
        self.editingSwitch.setOn(false, animated: false)
    }

    
    
    func textfieldShouldBeginEditing(textfield: UITextField) -> Bool {
        return self.editingSwitch.on
    }
    
    func textfieldShouldReturn(textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true;
    }

    @IBAction func enableEditing(sender: UISwitch) {
        
        if editingSwitch.on {
            textField3.enabled = true
            textField3.backgroundColor = UIColor.whiteColor()
        } else {
            textField3.enabled = false
            textField3.backgroundColor = UIColor.lightGrayColor()
        }

        
    }
 
    
}

