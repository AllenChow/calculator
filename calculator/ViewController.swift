//
//  ViewController.swift
//  calculator
//
//  Created by allen on 15/4/19.
//  Copyright (c) 2015年 allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayText: UILabel!
    var isNumber:Bool=false
    
    @IBAction func numberAction(sender: UIButton) {
        let title=sender.currentTitle!
        println(title)
        if isNumber{
            displayText.text=displayText.text!+title
        }else{
            displayText.text=title
            isNumber=true
        }
    }
  
    
    @IBAction func operate(sender: UIButton) {
        let operation=sender.currentTitle!
        if isNumber {
            enter()
        }
        switch operation{
            case "×":   performOperation {$0 * $1}
            
            case "+":   performOperation {$0 + $1}

            case "−":   performOperation {$1 - $0}

            case "÷":   performOperation {$1 / $0}

            case "√":   performOperation { sqrt($0)}
            
            default :break
            
        }
    }
    
    func performOperation(operation:(Double,Double) -> Double){
        if operandStack.count>=2{
            displayValue=operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }

    }
    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    @IBAction func enter() {
        isNumber=false
        operandStack.append(displayValue)
        println("operandStack:\(operandStack)")
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(displayText.text!)!.doubleValue
        }
        set{
            displayText.text="\(newValue)"
            isNumber=false
        }
    }
}

