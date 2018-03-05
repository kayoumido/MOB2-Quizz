//
//  ViewController.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var hintButton: UIButton!
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var answerButton1: UIButton!
    @IBOutlet var answerButton2: UIButton!
    @IBOutlet var answerButton3: UIButton!
    @IBOutlet var newGameButton: UIButton!
    
    var session : QuizSession!
    var timer = Timer()
    var time = 0
    var questionTime = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // hide new gae button
        self.newGameButton.isHidden = true
        
        // Create our game session, and get the first question
        self.newSession()
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

    @IBAction func NewGameClick(_ sender: Any) {
        
        // reset buttons and labels for new game
        self.answerButton1.isHidden = false
        self.answerButton2.isHidden = false
        self.answerButton3.isHidden = false
        self.hintLabel.isHidden = false
        self.hintButton.isHidden = false
        self.questionLabel.text = ""
        self.newGameButton.isHidden = true
        
        self.newSession()
    }
    
    @IBAction func hintClick(_ sender: UIButton) {
        hintLabel.isHidden = false
        hintButton.isHidden = true
    }
    
    func newSession() {
        self.session = WarriorQuizSession(questionRepository: RemoteQuestionRepository(remoteUrl: "http://localhost:4567"))
        self.runTimer()
        self.nextOne()
    }
    
    func nextOne() {
        hintLabel.isHidden = true
        hintButton.isHidden = false
        
        // get the next question from the session
        if let question = session.nextQuestion() {
            // Set the captions
            questionLabel.text = question.caption
            hintLabel.text = question.hint
            answerButton1.setTitle(question.answers[0], for: UIControlState())
            answerButton2.setTitle(question.answers[1], for: UIControlState())
            answerButton3.setTitle(question.answers[2], for: UIControlState())
        }
        else {
            endGame()
        }
    }
    
    func runTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        self.time = self.session.time
        self.questionTime = self.session.questionTime
        
        // check if session has a timer
        if (self.time > 0) {
            // yes, display label
            self.timerLabel.isHidden = false
            self.timerLabel.text = "\(self.timeString(time: TimeInterval(self.time)))"
        }
    }
    
    func updateTimer() {
        self.time -= 1
        self.questionTime -= 1
        if (self.time < 0 && self.session.time != 0) {
            endGame()
        }
        
        if (self.questionTime == 0) {
            nextOne()
            self.questionTime = self.session.questionTime
        }
        
        self.timerLabel.text = "\(self.timeString(time: TimeInterval(self.time)))"
    }
    
    func timeString(time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        
        return String(format:"%02i", seconds)
    }
    
    func endGame() {
        self.timer.invalidate()
        
        // No more questions! This is the end
        answerButton1.isHidden = true
        answerButton2.isHidden = true
        answerButton3.isHidden = true
        hintLabel.isHidden = true
        hintButton.isHidden = true
        self.newGameButton.isHidden = false
        self.timerLabel.isHidden = true
        
        questionLabel.text = "GAME OVER\nyour score: \(session.score) / \(session.questionsCount)"
    }
}

