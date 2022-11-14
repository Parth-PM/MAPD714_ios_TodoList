

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double  = 0;
    var previousNumber:Double = 0;
    var isPerformingOperation = false;
    var operation = 0;
    
    // Result Area Outlet for Portrait Mode
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    // Result Area Outlet for Landscape Mode
    
    @IBOutlet weak var calculatorResultsL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorResults.text = "0";
        calculatorResultsL.text = "0";
    }

    // Number Buttons Function for Portrait Mode
    
    @IBAction func numberButtonsTap(_ sender: UIButton) {
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            calculatorResults.text = sender.titleLabel!.text!
            numberOnScreen = Double(calculatorResults.text!)!
            }
        else {
        calculatorResults.text = calculatorResults.text! + sender.titleLabel!.text!
        numberOnScreen = Double(calculatorResults.text!)!
        }
    }
    
    // Number Buttons Function for Landscape Mode
    
    @IBAction func numberButtonsTapL(_ sender: UIButton) {
        if isPerformingOperation == true {
            isPerformingOperation = false
            calculatorResultsL.text = sender.titleLabel!.text!
            numberOnScreen = Double(calculatorResultsL.text!)!
            }
        else {
        calculatorResultsL.text = calculatorResultsL.text! + sender.titleLabel!.text!
        numberOnScreen = Double(calculatorResultsL.text!)!
        }
    }
    
    // Operator Buttons Function for Portrait Mode
    
    @IBAction func operatorButtonsTap(_ sender: UIButton) {
        
        // Clear Button
        
        if sender.tag == 18 {
            calculatorResults.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        
        // Delete Button
        
        else if sender.tag == 19 {
            isPerformingOperation = true
            let previousNumber = String(calculatorResults.text!)
            if (!previousNumber.description.isEmpty) {
                let delButton = previousNumber.prefix(upTo: previousNumber.index(before: previousNumber.endIndex))
                calculatorResults.text = String(delButton)
            }
            operation = sender.tag
        }
        
        // Operations: /(tag = 11), *(tag = 12), +(tag = 13), -(tag = 14), %(tag = 15), +/-(tag = 16)

        else if sender.tag == 11 { // Divide
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "/"
            operation = sender.tag
        }
        else if sender.tag == 12 { // Multiply
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "*"
            operation = sender.tag
        }
        else if sender.tag == 13 { // Plus
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "+"
            operation = sender.tag
        }
        else if sender.tag == 14 { // Minus
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "-"
            operation = sender.tag
        }
        else if sender.tag == 15 { // Percentage
            isPerformingOperation = true
            previousNumber = Double(calculatorResults.text!)!
            calculatorResults.text = "%"
            operation = sender.tag
        }
        else if sender.tag == 16 { // Plus minus
            isPerformingOperation = true
            var previousNumber = String(calculatorResults.text!)
            previousNumber = "-" + previousNumber
            calculatorResults.text = String(previousNumber)
            operation = sender.tag
        }
       
        // Equals to Button
        
        else if sender.tag == 17{
            if operation == 11 { // Divide
                calculatorResults.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 12 { // Multiply
                calculatorResults.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 13 { // Plus
                calculatorResults.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 14 { // Minus
                calculatorResults.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 { // Percentage
                calculatorResults.text = String(previousNumber / 100)
            }
            else if operation == 16 { // Plus Minus
                calculatorResults.text = String(previousNumber)
            }

        }
        
    }
    
    // Operator Buttons Function for Landscape Mode
    
    @IBAction func operatorButtonsTapL(_ sender: UIButton) {
        
        // Clear Button
        
        if sender.tag == 18 {
            calculatorResultsL.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        
        // Delete Button
        
        else if sender.tag == 19 {
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsL.text!)
            if (!previousNumber.description.isEmpty) {
                let delButton = previousNumber.prefix(upTo: previousNumber.index(before: previousNumber.endIndex))
                calculatorResultsL.text = String(delButton)
            }
            operation = sender.tag
        }
        
        // Operations: /(tag = 11), *(tag = 12), +(tag = 13), -(tag = 14), %(tag = 15), +/-(tag = 16), x^2(tag = 20), sqrt(tag = 21), sin(tag = 22), cos(tag = 23), tan(tag = 24), log(tag = 25)

        else if sender.tag == 11 { // Divide
            isPerformingOperation = true
            previousNumber = Double(calculatorResultsL.text!)!
            calculatorResultsL.text = "/"
            operation = sender.tag
        }
        else if sender.tag == 12 { // Multiply
            isPerformingOperation = true
            previousNumber = Double(calculatorResultsL.text!)!
            calculatorResultsL.text = "*"
            operation = sender.tag
        }
        else if sender.tag == 13 { // Plus
            isPerformingOperation = true
            previousNumber = Double(calculatorResultsL.text!)!
            calculatorResultsL.text = "+"
            operation = sender.tag
        }
        else if sender.tag == 14 { // Minus
            isPerformingOperation = true
            previousNumber = Double(calculatorResultsL.text!)!
            calculatorResultsL.text = "-"
            operation = sender.tag
        }
        else if sender.tag == 15 { // Percentage
            isPerformingOperation = true
            previousNumber = Double(calculatorResultsL.text!)!
            calculatorResultsL.text = "%"
            operation = sender.tag
        }
        else if sender.tag == 16 { // Plus minus
            isPerformingOperation = true
            var previousNumber = String(calculatorResultsL.text!)
            previousNumber = "-" + previousNumber
            calculatorResultsL.text = String(previousNumber)
            operation = sender.tag
        }
        else if sender.tag == 20 { // x-square
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsL.text!)
            let powNum = pow(Double(previousNumber)!, 2)
            calculatorResultsL.text = String(powNum)
            operation = sender.tag
        }
        else if sender.tag == 21 { // Square root
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsL.text!)
            let sqrtNum = Double(previousNumber)!.squareRoot()
            calculatorResultsL.text = String(sqrtNum)
            operation = sender.tag
        }
        else if sender.tag == 22 { // Sin
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsL.text!)
            let sinNum = sin(Double(previousNumber)! * Double.pi / 180)
            calculatorResultsL.text = String(sinNum)
            operation = sender.tag
        }
        else if sender.tag == 23 { // Cos
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsL.text!)
            let cosNum = cos(Double(previousNumber)! * Double.pi / 180)
            calculatorResultsL.text = String(cosNum)
            operation = sender.tag
        }
        else if sender.tag == 24 { // Tan
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsL.text!)
            let tanNum = tan(Double(previousNumber)! * Double.pi / 180)
            calculatorResultsL.text = String(tanNum)
            operation = sender.tag
        }
        else if sender.tag == 25 { // Log
            isPerformingOperation = true
            let previousNumber = String(calculatorResultsL.text!)
            let logNum = log10(Double(previousNumber)!)
            calculatorResultsL.text = String(logNum)
            operation = sender.tag
        }
       
        // Equals to Button
        
        else if sender.tag == 17{
            if operation == 11 { // Divide
                calculatorResultsL.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 12 { // Multiply
                calculatorResultsL.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 13 { // Plus
                calculatorResultsL.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 14 { // Minus
                calculatorResultsL.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 { // Percentage
                calculatorResultsL.text = String(previousNumber / 100)
            }
            else if operation == 16 { // Plus Minus
                calculatorResultsL.text = String(previousNumber)
            }
            else if operation == 20 { // x-square, operation will be repeated
                let previousNumber = String(calculatorResultsL.text!)
                let powNum = pow(Double(previousNumber)!, 2)
                calculatorResultsL.text = String(powNum)
            }
            else if operation == 21 { // Square Root, operation will be repeated
                let previousNumber = String(calculatorResultsL.text!)
                let sqrtNum = Double(previousNumber)!.squareRoot()
                calculatorResultsL.text = String(sqrtNum)
            }
            else if operation == 22 { // Sin, operation will be repeated
                let previousNumber = String(calculatorResultsL.text!)
                let sinNum = sin(Double(previousNumber)!)
                calculatorResultsL.text = String(sinNum)
            }
            else if operation == 23 { // Cos, operation will be repeated
                let previousNumber = String(calculatorResultsL.text!)
                let cosNum = cos(Double(previousNumber)!)
                calculatorResultsL.text = String(cosNum)
            }
            else if operation == 24 { // Tan, operation will be repeated
                let previousNumber = String(calculatorResultsL.text!)
                let tanNum = tan(Double(previousNumber)!)
                calculatorResultsL.text = String(tanNum)
            }
            else if operation == 25 { // Log, operation will be repeated
                let previousNumber = String(calculatorResultsL.text!)
                let logNum = log(Double(previousNumber)!)
                calculatorResultsL.text = String(logNum)
            }
        }
        
    }
    
}
