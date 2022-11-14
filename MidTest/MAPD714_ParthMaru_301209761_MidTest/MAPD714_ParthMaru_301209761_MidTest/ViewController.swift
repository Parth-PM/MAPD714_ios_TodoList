//
//  ViewController.swift
//  MAPD714_ParthMaru_301209761_MidTest
//
//  Created by Parth Maru on 2022-10-28.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var item1Name: UITextField!
    
    @IBOutlet weak var item2Name: UITextField!
    
    @IBOutlet weak var item3Name: UITextField!
    
    @IBOutlet weak var item4Name: UITextField!
    
    @IBOutlet weak var item5Name: UITextField!
    
    @IBOutlet weak var ShoppingListName: UITextField!
    
    @IBOutlet weak var item1Label: UILabel!
    
    @IBOutlet weak var item2Label: UILabel!
    
    @IBOutlet weak var item3Label: UILabel!
    
    @IBOutlet weak var item4Label: UILabel!
    
    @IBOutlet weak var item5Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShoppingListName.text = "My Shopping List"
        // Do any additional setup after loading the view.
    }

    // Slider Functions for Items 1-5

    @IBAction func item1Slider(_ sender: UISlider) {
        item1Label.text = String(Int(sender.value))
    }
    

    @IBAction func item2Slider(_ sender: UISlider) {
        item2Label.text = String(Int(sender.value))

    }
    
    @IBAction func item3Slider(_ sender: UISlider) {
        item3Label.text = String(Int(sender.value))

    }
    
    @IBAction func item4Slider(_ sender: UISlider) {
        item4Label.text = String(Int(sender.value))

    }
    
    @IBAction func item5Slider(_ sender: UISlider) {
        item5Label.text = String(Int(sender.value))

    }
    
    // Cancel Button Function to Reset everything
    @IBAction func cancelButton(_ sender: UIButton) {
        ShoppingListName.text = "My Shopping List"
        item1Label.text = String(1)
        item2Label.text = String(1)
        item3Label.text = String(1)
        item4Label.text = String(1)
        item5Label.text = String(1)
        item1Name.text = ""
        item2Name.text = ""
        item3Name.text = ""
        item4Name.text = ""
        item5Name.text = ""

    }
  
  // Save button that shows output in console
    
    @IBAction func Save(_ sender: UIButton) {
        print(ShoppingListName.text!)
        print(item1Name.text! , item1Label.text!)
        print(item2Name.text!, item2Label.text!)
        print(item3Name.text! , item3Label.text!)
        print(item4Name.text! , item4Label.text!)
        print(item5Name.text! , item5Label.text!)
    }
    
    // Saving the values in the next screen by using Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        // Creating variables to store the name of shopping list and items entered in textFields
        
        let shoppingList = ShoppingListName.text ?? ""
        let item1 = item1Name.text ?? ""
        let item2 = item2Name.text ?? ""
        let item3 = item3Name.text ?? ""
        let item4 = item4Name.text ?? ""
        let item5 = item5Name.text ?? ""
        let item1Quantity = item1Label.text ?? ""
        let item2Quantity = item2Label.text ?? ""
        let item3Quantity = item3Label.text ?? ""
        let item4Quantity = item4Label.text ?? ""
        let item5Quantity = item5Label.text ?? ""
            
        // Create a new variable to store the instance of the SecondViewController
        
        let destinationVC = segue.destination as! SecondViewController
        
        // setting the variables from the SecondViewController that will receive the data
        
        destinationVC.shoppingList = shoppingList
        destinationVC.item1 = item1
        destinationVC.item2 = item2
        destinationVC.item3 = item3
        destinationVC.item4 = item4
        destinationVC.item5 = item5
        destinationVC.item1Quantity = item1Quantity
        destinationVC.item2Quantity = item2Quantity
        destinationVC.item3Quantity = item3Quantity
        destinationVC.item4Quantity = item4Quantity
        destinationVC.item5Quantity = item5Quantity
    }

    
}

