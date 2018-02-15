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
    @IBOutlet var hintButton: UIButton!
    
    var session : QuizSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.newGameButtonStackView.isHidden = true
        // Create our game session, and get the first question
        self.initSession()
        self.nextOne()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerClick(_ sender: UIButton) {
        // Tell the session the chosen answer
        self.session.checkAnswer(sender.currentTitle!)
        
        // Pass to the next question
        self.nextOne()
    }

    @IBAction func newGameClick(_ sender: UIButton) {
        self.initSession()
        
        self.buttonStackView.isHidden = false
        self.hintButton.isHidden = false
        self.newGameButtonStackView.isHidden = true
    }
    
    @IBAction func displayHintClick(_ sender: Any) {

        self.hintButton.setTitle(self.session.currentQuestion!.hint, for: .normal)
    }
    
    func initSession() {
        self.session = QuizSession(LocalQuestionRepository(), 5)
        self.nextOne()
    }
    
    func resetHint() {
        self.hintButton.setTitle("?", for: .normal)
    }
    
    func nextOne() {
        
        // reset hint button
        self.resetHint()
        
        // get the next question from the session
        if let question = session.nextQuestion() {
            // Set the captions
            self.questionLabel.text = question.caption
            self.answerButton1.setTitle(question.answers[0], for: UIControlState())
            self.answerButton2.setTitle(question.answers[1], for: UIControlState())
            self.answerButton3.setTitle(question.answers[2], for: UIControlState())
        }
        else {
            // No more questions! This is the end
            self.buttonStackView.isHidden = true
            self.hintButton.isHidden = true
            
            self.answerButton1.setTitle("", for: UIControlState())
            self.answerButton2.setTitle("", for: UIControlState())
            self.answerButton3.setTitle("", for: UIControlState())
            
            // show new game button
            self.newGameButtonStackView.isHidden = false
            
            self.questionLabel.text = "You scored : \(session.score) out of \(session.questionCount) questions"
        }
    }
    
}

