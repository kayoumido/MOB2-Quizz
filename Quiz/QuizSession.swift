//
//  QuizSession.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import Foundation

class QuizSession {
    
    fileprivate var currentIndex: Int
    private var _score: Int
    private var _questionRepo: QuestionRepository
    private var _currentQuestion: Question?
    private var _maxNumberQuestions: Int
    private var _numberAnsweredQuestions: Int
    
    var score: Int {
        get {
            return self._score
        }
    }
    
    var questionCount: Int {
        get {
            return _maxNumberQuestions
        }
    }
    
    var currentQuestion: Question? {
        get {
            return self._currentQuestion
        }
    }
    
    init(_ questionRepo: QuestionRepository, _ maxQuestion: Int) {
        
        self.currentIndex = -1
        self._score = 0
        self._questionRepo = questionRepo
        self._currentQuestion = nil
        self._maxNumberQuestions = maxQuestion
        self._numberAnsweredQuestions = 0
    }
    
    func nextQuestion() -> Question? {
        
        // check if max number of questions was reached
        if (self._numberAnsweredQuestions == self._maxNumberQuestions) {
            return nil
        }
        // increase number of questions answered
        self._numberAnsweredQuestions += 1
        // get new question
        self._currentQuestion = self._questionRepo.fetchQuestion()
        return self._currentQuestion
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        let result: Bool = self._currentQuestion!.isCorrectAnswer(answer)
        if result {
            self._score += 1
        }
        return result
    }
}
