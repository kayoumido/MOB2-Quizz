//
//  ViewController.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButton1: UIButton!
    @IBOutlet var answerButton2: UIButton!
    @IBOutlet var answerButton3: UIButton!
    
    var session : QuizSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create our game session, and get the first question
        session = QuizSession()
        nextOne()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerClick(_ sender: UIButton) {
        // Tell the session the chosen answer
        session.checkAnswer(sender.currentTitle!)
        
        // Pass to the next question
        nextOne()
    }

    func nextOne() {
        // get the next question from the session
        if let question = session.nextQuestion() {
            // Set the captions
            questionLabel.text = question.caption
            answerButton1.setTitle(question.answers[0], for: UIControlState())
            answerButton2.setTitle(question.answers[1], for: UIControlState())
            answerButton3.setTitle(question.answers[2], for: UIControlState())
        }
        else {
            // No more questions! This is the end
            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            
            questionLabel.text = "GAME OVER"
        }
    }
    
}

