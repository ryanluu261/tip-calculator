//
//  ViewController.swift
//  Prework
//
//  Created by Ryan Luu on 2/4/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func calculateTip() {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    // UI Control Events
    
    @IBAction func billAmountTextFieldChanged(_ sender: Any) {
        calculateTip()
    }
    
    
    @IBAction func tipControlValueChanged(_ sender: Any) {
        tipAmountLabel.text! = String(format: "$%.2f", arguments: [tipControl.selectedSegmentIndex])
        calculateTip()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == billAmountTextField {
            billAmountTextField.resignFirstResponder()
        }
        return true
    }


}

