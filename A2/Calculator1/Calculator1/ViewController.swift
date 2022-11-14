//
//  ViewController.swift
//  Calculator1
//

// CALCULATOR APPLICATION
// DEEP HARISHKUMAR MEHTA - 301212407
// KHUSHBOO KODWANI - 301273818
// PARTH MARU - 301209761

// We Created a basic calculator application for iOS that includes different operator buttons, number keys, delete key, backspace key and decimal key and added different mathematical operations.

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double  = 0;
    var previousNumber:Double = 0;
    // operation performing flag
    var isPerformingOperation = false;
    var operation = 0;
    var isDecimal = false;
    
    // left and right side variable
    var lhs=false
    var rhs=false
    
    // Result Area Outlet for Potrait
    
    @IBOutlet weak var calculatorResuls: UILabel!
    
    // Result Area Outlet for Landscape
    
    @IBOutlet weak var calculatorResultsLandscape: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorResuls.text = "0";
        calculatorResultsLandscape.text = "0";
        // Do any additional setup after loading the view.
    }

    // Number Buttons Functionvfor Potrait Mode
    
    //below method bind all the number buttons
    
    @IBAction func numberButtonsTap(_ sender: UIButton) {
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            calculatorResuls.text = String(sender.tag-1)
            numberOnScreen = Double(calculatorResuls.text!)!
            rhs=true
            }
        else {
            if calculatorResuls.text == "0"{
                calculatorResuls.text = String(sender.tag-1)
                lhs=true
            }
            else
            {
                calculatorResuls.text = calculatorResuls.text! + String(sender.tag-1)
                numberOnScreen = Double(calculatorResuls.text!)!
                lhs=true
            }
            
        }
        
    }
    
    // Number Buttons Functionvfor Landscape Mode
    
    //below method bind all the number buttons
    
    
    @IBAction func numberButtonsTapLandscape(_ sender:UIButton) {
       
        if isPerformingOperation == true {
            isPerformingOperation = false
            calculatorResultsLandscape.text = String(sender.tag-1)
            numberOnScreen = Double(calculatorResultsLandscape.text!)!
            rhs=true
            }
        else {
            if calculatorResultsLandscape.text == "0"{
                calculatorResultsLandscape.text = String(sender.tag-1)
                lhs=true
            }
            else
            {
                calculatorResultsLandscape.text = calculatorResultsLandscape.text! + String(sender.tag-1)
                numberOnScreen = Double(calculatorResultsLandscape.text!)!
                lhs=true
            }
            
        }
    }
    
    // Operator Buttons Function for Potrait Mode
    
    //Below method bind all the mathematical operations, equals button, decimal button, clear button and delete button
    @IBAction func operatorButtonsTap(_ sender: UIButton) {
        
        // Clear Button
        
        if sender.tag == 19 {
            calculatorResuls.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            lhs=false
            rhs=false
            isPerformingOperation=false
            isDecimal = false
            return
        }
        
        // Delete Button
        
        else if sender.tag == 20 {
            isPerformingOperation = false
        
            if (!calculatorResuls.description.isEmpty) {
                if calculatorResuls.text!.count == 1 {
                    calculatorResuls.text = "0"
                } else {
                    calculatorResuls.text?.removeLast()
                }
            }
            //operation = sender.tag
        }
        
        // Operations: /(tag = 11), *(tag = 12), +(tag = 13), -(tag = 14), %(tag = 15), +/-(tag = 16), .(tag = 17)
        
        else if sender.tag == 11 { // Divide
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResuls.text!)!
                calculatorResuls.text = "/"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
        }
        else if sender.tag == 12 { // Multiply
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResuls.text!)!
                calculatorResuls.text = "*"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }        }
        else if sender.tag == 13 { // Plus
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResuls.text!)!
                calculatorResuls.text = "+"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
            
        }
        else if sender.tag == 14 { // Minus
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResuls.text!)!
                calculatorResuls.text = "-"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
        }
        else if sender.tag == 15 { //Percentage
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResuls.text!)!
                calculatorResuls.text = "%"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
        }
        else if sender.tag == 16 { // Plus minus
            isPerformingOperation = true
            var previousNumber = String(calculatorResuls.text!)
            previousNumber = "-" + previousNumber
            calculatorResuls.text = String(previousNumber)
            operation = sender.tag
        }
        else if sender.tag == 17 { // Decimal point
            
            isPerformingOperation = false
            if lhs==true && rhs==false && !isDecimal {
                if previousNumber.description.count <= 7 {
                    var previousNumber = String(calculatorResuls.text!)
                    previousNumber += "."
                    calculatorResuls.text = previousNumber
                    //operation = sender.tag
                    isDecimal = true
                }
                
            } else if lhs==true && rhs==true { // Decimal Point
                if numberOnScreen.description.count <= 7 && !isDecimal{
                    var number = String(calculatorResuls.text!)
                    number += "."
                    calculatorResuls.text = number
                    //operation = sender.tag
                    isDecimal = true
                }
            }
         
        }
       
        // Equals to Button
        
        else if sender.tag == 18{
            var res:Double = 0
            if operation == 11 {
                res = previousNumber / numberOnScreen
            }
            else if operation == 12 {
                res = previousNumber * numberOnScreen
            }
            else if operation == 13 {
                 res = previousNumber + numberOnScreen
            }
            else if operation == 14 {
                res = previousNumber - numberOnScreen
            }
            else if operation == 15 {
                res = previousNumber / 100
            }
            else if operation == 16 {
                calculatorResuls.text = String(previousNumber)
            }
            else if operation == 17 {
                calculatorResuls.text = String(previousNumber)
            }
            calculatorResuls.text = String(res)
            previousNumber = res
            isDecimal = false
            lhs=true
            rhs=false
            isPerformingOperation=false
            
        }
        
        
    }
    
    
    // Operator Buttons Function for Landscape Mode
    
    //Below method bind all the mathematical operations, equals button, decimal button, clear button and delete button

    
    @IBAction func operatorButtonsTapLandscape(_ sender: UIButton) {
        
        // Clear Button
        
        if sender.tag == 18 {
            calculatorResultsLandscape.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            lhs=false
            rhs=false
            isPerformingOperation=false
            isDecimal = false
            return
        }
        
        // Delete Button
        
        else if sender.tag == 19 {
            isPerformingOperation = false
        
            if (!calculatorResultsLandscape.description.isEmpty) {
                if calculatorResultsLandscape.text!.count == 1 {
                    calculatorResultsLandscape.text = "0"
                } else {
                    calculatorResultsLandscape.text?.removeLast()
                }
            }
            //operation = sender.tag
        }
        
        // Operations: /(tag = 11), *(tag = 12), +(tag = 13), -(tag = 14), %(tag = 15), +/-(tag = 16), .(tag = 17)
        
        else if sender.tag == 11 { // Divide Operation
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResultsLandscape.text!)!
                calculatorResultsLandscape.text = "/"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
        }
        else if sender.tag == 12 { // Multiply Operation
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResultsLandscape.text!)!
                calculatorResultsLandscape.text = "*"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }        }
        else if sender.tag == 13 { // Plus Operation
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResultsLandscape.text!)!
                calculatorResultsLandscape.text = "+"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
            
        }
        else if sender.tag == 14 { // Minus Operation
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResultsLandscape.text!)!
                calculatorResultsLandscape.text = "-"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
        }
        else if sender.tag == 15 { //Percentage
            if lhs==true && rhs==false{
                
                isPerformingOperation = true
                previousNumber = Double(calculatorResultsLandscape.text!)!
                calculatorResultsLandscape.text = "%"
                operation = sender.tag
                isDecimal = false
            }
            else if lhs==true && rhs==true{
                calculation()
               // calculatorResuls.text = "+"
                operation = sender.tag
            }
        }
        else if sender.tag == 16 { // Plus minus
            isPerformingOperation = true
            var previousNumber = String(calculatorResultsLandscape.text!)
            previousNumber = "-" + previousNumber
            calculatorResultsLandscape.text = String(previousNumber)
            operation = sender.tag
        }
        
        else if sender.tag == 20 { // x-square
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsLandscape.text!)
            let powNum = pow(Double(previousNumber)!, 2)
            calculatorResultsLandscape.text = String(powNum)
            operation = sender.tag
        }
        
        else if sender.tag == 21 { // Square Root
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsLandscape.text!)
            let sqrtNum = Double(previousNumber)!.squareRoot()
            calculatorResultsLandscape.text = String(sqrtNum)
            operation = sender.tag
        }
        
        else if sender.tag == 22 { // Sin
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsLandscape.text!)
            let sinNum = sin(Double(previousNumber)! * Double.pi / 180)
            calculatorResultsLandscape.text = String(sinNum)
            operation = sender.tag
        }
        else if sender.tag == 23 { // Cos
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsLandscape.text!)
            let cosNum = cos(Double(previousNumber)! * Double.pi / 180)
            calculatorResultsLandscape.text = String(cosNum)
            operation = sender.tag
        }
        else if sender.tag == 24 { // Tan
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsLandscape.text!)
            let tanNum = tan(Double(previousNumber)! * Double.pi / 180)
            calculatorResultsLandscape.text = String(tanNum)
            operation = sender.tag
        }
        else if sender.tag == 25 { // Log
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsLandscape.text!)
            let logNum = log10(Double(previousNumber)!)
            calculatorResultsLandscape.text = String(logNum)
            operation = sender.tag
        }
        
        else if sender.tag == 0 { // Decimal point
            
            isPerformingOperation = false
            if lhs==true && rhs==false && !isDecimal {
                if previousNumber.description.count <= 7 {
                    var previousNumber = String(calculatorResultsLandscape.text!)
                    previousNumber += "."
                    calculatorResultsLandscape.text = previousNumber
                    //operation = sender.tag
                    isDecimal = true
                }
                
            } else if lhs==true && rhs==true {// Decimal Point
                if numberOnScreen.description.count <= 7 && !isDecimal{
                    var number = String(calculatorResultsLandscape.text!)
                    number += "."
                    calculatorResultsLandscape.text = number
                    //operation = sender.tag
                    isDecimal = true
                }
            }
            
         
        }
       
        // Equals to Button
        
        else if sender.tag == 17{
            var res:Double = 0
            if operation == 11 {
                res = previousNumber / numberOnScreen
            }
            else if operation == 12 {
                res = previousNumber * numberOnScreen
            }
            else if operation == 13 {
                 res = previousNumber + numberOnScreen
            }
            else if operation == 14 {
                res = previousNumber - numberOnScreen
            }
            else if operation == 15 {
                res = previousNumber / 100
            }
            else if operation == 16 {
                calculatorResultsLandscape.text = String(previousNumber)
            }
            //else if operation == 17 {
              //  calculatorResultsLandscape.text = String(previousNumber)
           // }
            calculatorResultsLandscape.text = String(res)
            previousNumber = res
            isDecimal = false
            lhs=true
            rhs=false
            isPerformingOperation=false
            
        }
        
        
    }
    
    // Calculation method perfom all the calculations that works on operator buttons click
    func calculation (){
        var result:Double = 0
        if operation == 11 {
            result = previousNumber / numberOnScreen

        }
        else if operation == 12 {
            result = previousNumber * numberOnScreen
        }
        else if operation == 13 {
            result = previousNumber + numberOnScreen
       
        }
        else if operation == 14 {
            result = previousNumber - numberOnScreen
        }
        else if operation == 15 {
            result = previousNumber / 100
        }
        
        calculatorResuls.text = String(result)
        previousNumber = result
        
        calculatorResultsLandscape.text = String(result)
        previousNumber = result
        
        // Reseting all flags
        isPerformingOperation = true
        isDecimal = false
        lhs=true
        rhs=false
        
    }
    
    
}

