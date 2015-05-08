//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Brendan McDonald on 5/7/15.
//  Copyright (c) 2015 Dangerous Design LLC. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var whatUserPlayedLabel: UILabel!
    @IBOutlet weak var whatComputerPlayedLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultExplanationLabel: UILabel!
    
    @IBOutlet weak var testLabel: UILabel!
    
    var testData: String?
    var computerChoice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.testLabel.text = testData
        self.whatComputerPlayedLabel.text = computerChoice
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgain() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
