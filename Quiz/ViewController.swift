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
    @IBOutlet var newGameButton: UIButton!
    @IBOutlet var buttonStackView: UIStackView!
    @IBOutlet var newGameButtonStackView: UIStackView!
    
    var session : QuizSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.newGameButtonStackView.isHidden = true
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

    @IBAction func newGameClick(_ sender: UIButton) {
        session = QuizSession()
        nextOne()
        
        buttonStackView.isHidden = false
        newGameButtonStackView.isHidden = true
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
            buttonStackView.isHidden = true
            
            answerButton1.setTitle("", for: UIControlState())
            answerButton2.setTitle("", for: UIControlState())
            answerButton3.setTitle("", for: UIControlState())
            
            // show new game button
            newGameButtonStackView.isHidden = false
            
            questionLabel.text = "You scored : \(session.score) out of \(session.questionCount) questions"
        }
    }
    
}

