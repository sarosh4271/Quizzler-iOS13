//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
 var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotIt = quizBrain.checkAnswer(userAnswer)
        
//        let actualAnswer = quiz[questionNumber].answer
        
        if userGotIt{
            print("Correct! Hooraay")
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            print("Oh no! Its incorrect")
        }
        Timer.scheduledTimer(timeInterval: 0.19, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
       
        quizBrain.nextQuestion()
        
        
    }
 
    @objc func updateUI(){
        scoreLabel.text = "Score: \(quizBrain.getScore())"
       questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
       progressBar.progress =  quizBrain.getProgress()

    }
    
}

