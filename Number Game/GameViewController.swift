//
//  GameViewController.swift
//  Number Game
//
//  Created by Mateusz Januszko on 01/05/2019.
//  Copyright © 2019 Mateusz Januszko. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var num1 = 0
    var num2 = 0
    var score = 0
    let minRand = 1
    let maxRand = 10
    var timeLeft: Float = 1.0
    var givenTime: Float = 1.0
    var progress: Float = 1.0
    var answer = false
    var timeStep: Float = 0.02
    
    var timer: Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    @IBAction func TrueTouch(_ sender: UIButton) {
        
        answer = true
        checkAnswer()

    }
    
    @IBAction func FalseTouch(_ sender: UIButton) {
        
        answer = false
        checkAnswer()
    }
    
    func checkAnswer() {
        if answer == (num1 > num2) {
            score += 1
            ScoreLabel.text = "Score: \(score)"
            resetGame()
        } else {
            performSegue(withIdentifier: "goback", sender: self)
        }
    }
    
    func setUp() {
        score = 0
        resetGame()
        gameLoop()
    }
    
    @objc func gameLoop() {
        timeLeft -= timeStep
        progress = timeLeft / givenTime
        progressView.setProgress(progress, animated: false)
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeStep), target: self, selector: #selector(gameLoop), userInfo: nil, repeats: false)
        
        if timeLeft <= 0 {
            performSegue(withIdentifier: "goback", sender: self)
        }
    }
    
    func resetGame() {
        num1 = Int(arc4random_uniform(UInt32(maxRand-minRand+1))) + minRand
        num2 = Int(arc4random_uniform(UInt32(maxRand-minRand+1))) + minRand
        ResultLabel.text = "\(num1) > \(num2)"
        timeLeft = givenTime
        progress = 1.0
        progressView.setProgress(progress, animated: false)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goback" {
            let dest = segue.destination as! ViewController
            dest.previousScore = score
        }
    }

}
