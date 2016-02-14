//
//  ViewController.swift
//  Calculator
//
//  Created by Bradley Miller on 12/31/15.
//  Copyright © 2015 Bradley Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!  // = nil is understood, but it is always automtically unwrapped (implicitly unwrapped optional)

    var userIsInTheMiddleOfTypingANumber = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit = \(digit)")
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
    }
    
    var operandStack = Array<Double>()
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print(operandStack)
        
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        print(operation)
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×": performOperation({ $0 * $1 })
        case "÷":performOperation({ $1 / $0 })
        case "-":performOperation({ $1 - $0 })
        case "+":performOperation({ $0 + $1 })
        case "√": performOperation({sqrt($0)})
        default: break
            
        
        }
        
    }
    
    @nonobjc
    func performOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }

    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }



}

