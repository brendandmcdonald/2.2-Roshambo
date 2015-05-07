//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Brendan McDonald on 5/7/15.
//  Copyright (c) 2015 Dangerous Design LLC. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    var testData = "Hello, World"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Option 1: Solely Programmatic VC Presentation
    @IBAction func rockResults() {
        // code only
        var controller: ResultsViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        controller.testData = testData
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    // Option 2: Programmatic + Segue VC Presentation
    @IBAction func paperResults() {
        
        performSegueWithIdentifier("customSegue", sender: self)
        //code segue
    }
    
    // Option 3: Segue only; no code for VC Presentation.    
    
    @IBAction func scissorsResults() {
        //segue only
    }
    
    // This method supports both options 2 and 3 for passing data between VCs.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! ResultsViewController
        
        controller.testData = testData
    }
}

/*
func throwDown(playersMove: RPS)
{
// Here the RPS enum generates the opponent's move
let computersMove = RPS()

// =The RPSMatch struct stores the results of a match
self.match = RPSMatch(p1: playersMove, p2: computersMove)

//Here are the 3 ways of presenting a View Controller

// 1st Way: Programmatic View Controller Presentation
if (playersMove == RPS.Rock) {
// Get the storyboard and ResultViewController
var storyboard = UIStoryboard (name: "Main", bundle: nil)
var resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController

// Communicate the match
resultVC.match = self.match
self.presentViewController(resultVC, animated: true, completion: nil)
}

// 2nd Way: Code plus Segue
else if (playersMove == RPS.Paper) {
performSegueWithIdentifier("throwDownPaper", sender: self)
}

// 3rd Way: Segue Only, No code!
// But don't forget to implement prepareForSegue.
}

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

//Notice that this code works for both Scissors and Paper
let controller = segue.destinationViewController as! ResultViewController
controller.match = self.match
}
*/

