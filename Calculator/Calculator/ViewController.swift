//
//  ViewController.swift
//  Calculator
//
//  Created by talgat on 28.05.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
  

    @IBAction func Clean(_ sender: Any) {
        brain = BrainOfCalculator()
        userIsInTheMiddleOfTyping = false
        displayValue = 0
        DescribeOperation.text = ""
    }

    
    
    @IBOutlet weak var DescribeOperation: UILabel!
    @IBOutlet weak  var display: UILabel!
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
              let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            if (display.text!.range(of:".") != nil && (digit == ".") ) { return }
            display.text = display.text! + digit
        } else {
            if digit == "." {
                display.text = "0."
            } else {
                display.text = digit
            }
            userIsInTheMiddleOfTyping = true
        }
    }
    
    
    var displayValue: Double{ 
        get{
        return Double(display.text!)!
        }
        set{
        display.text = String(newValue)
        }
    }
    
    /*
     if (digit == "․") {
     if (display.text.range(of: ".") == nil) {
    
     display.text = display.text + "."
     
     } else {
     // attempts in creating floating point
     }
 */
    private var brain = BrainOfCalculator()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand( displayValue )
            userIsInTheMiddleOfTyping = false
        }
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOpearation(mathematicalSymbol)
        }
        if let result=brain.result {
        displayValue = result 
        }
    
         if let description = brain.description {
         DescribeOperation.text = description + (brain.resultIsPending ? "…" : "=")
         } else {
             DescribeOperation.text = " "
        }
        
    }
}

