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
    // var userChoice: String? NOT USING THIS BECAUSE WE DONT COLLECT THIS. WE JUMP STRAIGHT FROM BUTTON PRESS TO SWITCH STATEMENTS THAT DETERMINE THE WINNER.
    
    var winner: String?
    var winnerExlanation: String?
    
    
    // These variables make our code cleaner and not hard-coded.
    let r = "Rock"
    let p = "Paper"
    let s = "Scissors"
    
    let userWon = "You Won!"
    let computerWon = "You Lost."
    let tie = "You Tied."
    
    let tieExplanation = "Samesies!"
    let paperAndRockExplanation = "Paper Covers Rock"
    let rockAndScissorsExplanation = "Rock Smashes Scissors"
    let scissorsAndPaperExplanation = "Scissors Cut Paper"
    
    // :) Add a function that makes a random play for the computer and outputs it to "computerChoice".
    // :) Fix autolayout so everything is visible
    // :) Make this "computerChoice" display in all results views.
    // TODO: Make a function that switches on "user choice" to capture which choice a user made and send it to a variable "userChoice".
    // TODO: Compare user choices to computer choices and use it to determine a winner.
    // TODO: Make this "userChoice" display in all results views.
    // TODO: Make a function that determines who won (or modify the user capture function to include this).
    // TODO: Make the gameplay function, referenced above, output the winner to a new class variable.
    // TODO: Pass this new class variable to the results VC with each of the three presentation approaches for the next VC.
    // TODO: Append the function to conditionally display "you won" or "you lost" 
    // TODO: Make the "you won" or "you lost" display on results
    // TODO: Append the function or create a new one to include description messages
    // TODO: Make these description messages appear in the results VC. (Data is passed and outlets are set up.)
    // TODO: Delete all test data in presentation and code
    
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
        
        // User Chose Rock: Compare user choice to computer choice; output winner.
        switch self.computerChoice!{
            case p:
                self.winner = computerWon
                self.winnerExlanation = paperAndRockExplanation
            case s:
                self.winner = userWon
                self.winnerExlanation = rockAndScissorsExplanation
            default:
                self.winner = tie
                self.winnerExlanation = tieExplanation
            }
        
        controller.computerChoice = self.computerChoice
        controller.userChoice = r
        controller.whoWon = self.winner
        controller.whoWonExplanation = self.winnerExlanation
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    // Option 2: Programmatic + Segue VC Presentation
    @IBAction func paperResults() {
        
        performSegueWithIdentifier("paper", sender: self)
        //code segue
    }
    
    // Option 3: Segue only; no code for VC Presentation.    
    
    @IBAction func scissorsResults() {
        //segue only
    }
    
    // This method supports both options 2 and 3 for passing data between VCs.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController as! ResultsViewController
        
        controller.computerChoice = self.computerChoice
        
        if segue.identifier == "paper" {
            //Pass data on user choice.
            controller.userChoice = p
            
            // User Chose Paper: Compare user choice to computer choice; output winner.
            switch self.computerChoice!{
            case s:
                self.winner = computerWon
                self.winnerExlanation = scissorsAndPaperExplanation
            case r:
                self.winner = userWon
                self.winnerExlanation = paperAndRockExplanation
            default:
                self.winner = tie
                self.winnerExlanation = tieExplanation
            }
        }
        else {
            //This means the user chose Scissors
            
            //Pass data on user choice.
            controller.userChoice = s
            
            // User Chose Paper: Compare user choice to computer choice; output winner.
            switch self.computerChoice!{
            case r:
                self.winner = computerWon
                self.winnerExlanation = rockAndScissorsExplanation
            case p:
                self.winner = userWon
                self.winnerExlanation = scissorsAndPaperExplanation
            default:
                self.winner = tie
                self.winnerExlanation = tieExplanation
            }
        }
        
        controller.whoWon = self.winner
        controller.whoWonExplanation = self.winnerExlanation
        
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
    
}
