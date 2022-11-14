//
//  SecondViewController.swift
//  MAPD714_ParthMaru_301209761_MidTest
//
//  Created by Parth Maru on 2022-10-28.
//

import UIKit

class SecondViewController: UIViewController {

    
    var shoppingList: String?
    var item1: String?
    var item2: String?
    var item3: String?
    var item4: String?
    var item5: String?
    var item1Quantity: String?
    var item2Quantity: String?
    var item3Quantity: String?
    var item4Quantity: String?
    var item5Quantity: String?
    
    // Shopping List Name Output Label
    
    @IBOutlet weak var ShoppingListNameOut: UILabel!
    
    // Item 1-5 Names Output Labels

    @IBOutlet weak var item1NameOut: UILabel!
    
    @IBOutlet weak var item2NameOut: UILabel!
    
    @IBOutlet weak var item3NameOut: UILabel!
    
    @IBOutlet weak var item4NameOut: UILabel!
    
    @IBOutlet weak var item5NameOut: UILabel!
  
    // Items 1-5 Quantity Output Labels

    @IBOutlet weak var item1LabelOut: UILabel!
    
    @IBOutlet weak var item2LabelOut: UILabel!
    
    @IBOutlet weak var item3LabelOut: UILabel!
    
    @IBOutlet weak var item4LabelOut: UILabel!
    
    @IBOutlet weak var item5LabelOut: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ShoppingListNameOut.text = shoppingList
        item1NameOut.text = item1
        item2NameOut.text = item2
        item3NameOut.text = item3
        item4NameOut.text = item4
        item5NameOut.text = item5
        item1LabelOut.text = item1Quantity
        item2LabelOut.text = item2Quantity
        item3LabelOut.text = item3Quantity
        item4LabelOut.text = item4Quantity
        item5LabelOut.text = item5Quantity    }
    



}
