//
//  ViewController.swift
//  Number Game
//
//  Created by Mateusz Januszko on 01/05/2019.
//  Copyright © 2019 Mateusz Januszko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var previousScoreLabel: UILabel!
    
    var previousScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func unwindToMainScreen(seque: UIStoryboardSegue) {
        previousScoreLabel.text = "Previous Score: \(previousScore)"
    }


}

