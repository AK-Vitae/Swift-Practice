//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlet allows me to reference a UI element
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        //diceImageView1.alpha = 0.5
    //        //diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
    //        //diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
    //    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
    }
    
    @IBAction func rollButtonPressed2(_ sender: Any) {
        for _ in 1...50 {
            diceImageView1.image = diceArray[Int.random(in: 0...5)]
            diceImageView2.image = diceArray[Int.random(in: 0...5)]
        }
    }
}

