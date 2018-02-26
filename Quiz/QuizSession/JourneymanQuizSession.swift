//
//  JourneymanQuizSession.swift
//  Quiz
//
//  Created by Doran Kayoumi on 26.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class JourneymanQuizSession : QuizSession {
    var _currentQuestionCount: Int
    private var _wasLastQuestionCorrect: Bool
    
    init(questionRepository: QuestionRepository) {
        _currentQuestionCount = 1
        _wasLastQuestionCorrect = true
        super.init(questionRepository: questionRepository, totalQuestionCount: 10)
    }
    
    override func nextQuestion() -> Question? {
        
        if _currentQuestionCount > _totalQuestionCount {
            return nil
        }
        
        if !_wasLastQuestionCorrect {
            return _currentQuestion
        }
        _currentQuestionCount += 1
        return super.nextQuestion()
    }
    
    override func checkAnswer(_ answer: String) -> Bool {
        _wasLastQuestionCorrect = super.checkAnswer(answer)
        if _wasLastQuestionCorrect {
            _score += 1
        }
        else {
            _score -= 1
        }
        
        return _wasLastQuestionCorrect
    }
    
}
