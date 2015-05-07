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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rockResults() {
        
        var controller: ResultsViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
}

