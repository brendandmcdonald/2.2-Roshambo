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
    
    var computerChoice: String?
    var userChoice: String?
    
    let r = "Rock"
    let p = "Paper"
    let s = "Scissors"
    
    var testData = "Hello, World"
    
    // :) Add a function that makes a random play for the computer and outputs it to "computerChoice".
    // :) Fix autolayout so everything is visible
    // :) Make this "computerChoice" display in all results views.
    // TODO: Make a function that switches on "user choice" to capture which choice a user made and send it to a variable "userChoice".
    // TODO: Make this "userChoice" display in all results views.
    // TODO: Make a function that determines who won (or modify the user capture function to include this).
    // TODO: Make the gameplay function, referenced above, output the winner to a new class variable.
    // TODO: Pass this new class variable to the results VC with each of the three presentation approaches for the next VC.
    // TODO: Append the function to conditionally display "you won" or "you lost" 
    // TODO: Make the "you won" or "you lost" display on results
    // TODO: Append the function or create a new one to include description messages
    // TODO: Make these description messages appear in the results VC. (Data is passed and outlets are set up.)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        computerPlay() // set up the initial value for computer choice.
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
        controller.computerChoice = self.computerChoice
        
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
        controller.computerChoice = self.computerChoice
    }
    
    
    ///// This is the area where we do all of the gameplay
    
    func computerPlay(){
        // returns a random play choice for the computer
        switch arc4random() % 3 {
        case 0:
            self.computerChoice = r
        case 1:
            self.computerChoice = p
        default:
            self.computerChoice = s
        }
    }
    
    /*
    let winner: String
    let userChoice: String
    
    func computerChooses() {
        // Choose a random element from RPS and set result as class variable.
        var choice: String
        let randomNumberFrom1To3 = Int(1 + arc4random() % 3)
        switch randomNumberFrom1To3{
        case 1: computerChoice = r
        case 2: self.computerChoice = p
        case 3: self.computerChoice = s
        default: println("there is an error")
        }
    
    */
    
    
    
    
    
    
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

