//
//  RestQuitSession.swift
//  Quiz
//
//  Created by Doran Kayoumi on 12.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class RestQuizSession: QuizSession {
    
    internal var _score: Int
    internal var questionCount: Int
    internal var currentQuestion: Question
    
    internal var score: Int {
        get {
            return self._score
        }
    }
    
    init() {
        self._score = 0
        self.questionCount = 0
        self.currentQuestion = Question(
            caption: "",
            answers: ["1", "2", "4"],
            correctAnswer: "",
            hint: ""
        )
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        return true
    }
    
    func nextQuestion() -> Question? {
        return self.currentQuestion
    }
}
