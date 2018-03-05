//
//  NinjaQuizSession.swift
//  Quiz
//
//  Created by Doran Kayoumi on 01.03.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class NinjaQuizSession : QuizSession {
    var _currentQuestionCount: Int
    private var _wasLastQuestionCorrect: Bool
    
    init(questionRepository: QuestionRepository) {
        self._currentQuestionCount = 1
        self._wasLastQuestionCorrect = true
        
        super.init(questionRepository: questionRepository, totalQuestionCount: 15)
        _time = 30
        _questionTime = 3
    }
    
    override func nextQuestion() -> Question? {
        
        if self._currentQuestionCount > _totalQuestionCount {
            return nil
        }
        
        if !self._wasLastQuestionCorrect {
            return _currentQuestion
        }
        self._currentQuestionCount += 1
        return super.nextQuestion()
    }
    
    override func checkAnswer(_ answer: String) -> Bool {
        self._wasLastQuestionCorrect = super.checkAnswer(answer)
        if self._wasLastQuestionCorrect {
            _score += 1
        }
        else {
            _score -= 1
        }
        
        return self._wasLastQuestionCorrect
    }
}
