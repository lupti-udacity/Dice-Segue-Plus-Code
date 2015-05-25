//
//  RollViewController.swift
//  Dice
//  
//  Segue with Code method: "Roll The Dice" button is connected to the IBAction. However, the
//  IBAction calls "performSegueWithIdentifier" to transition the scene from Roll View 
//  to Dice View. PerformSegueWithIdentifier requires you to implement "prepareForSegue" property.
//
//  Additional note prepared by Lupti in May 2015.
//  Created by Jason Schatz on 11/6/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class RollViewController: UIViewController {
    /**
    * Randomly generates a Int from 1 to 6
    */
    func randomDiceValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 6
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    // Segue expects you to implement prepareForSegue after performSegueWithIdentifier to prepare necessary information needed by the destination view controller.
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rollDice" {
            let controller = segue.destinationViewController as! DiceViewController
            controller.firstValue = self.randomDiceValue()
            controller.secondValue = self.randomDiceValue()
        }
    }
    
    @IBAction func rollTheDice(){
        performSegueWithIdentifier("rollDice", sender: self)
    }
    
}

