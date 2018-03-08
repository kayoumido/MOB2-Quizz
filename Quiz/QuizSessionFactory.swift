//
//  QuizSessionFactory.swift
//  Quiz
//
//  Created by Doran Kayoumi on 05.03.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class QuizSessionFactory {
    
    enum QuizSessionFactoryError: String, Error {
        case unknownQuizSession = "Unknown quiz session type"
    }
    
    static func create(_ sessionType: String, _ questioRepo: QuestionRepository) throws -> QuizSession {
        switch sessionType {
        case "Rookie":
            return RookieQuizSession(questionRepository: questioRepo)
        case "Journeyman":
            return JourneymanQuizSession(questionRepository: questioRepo)
        case "Warrior":
            return WarriorQuizSession(questionRepository: questioRepo)
        case "Ninja":
            return NinjaQuizSession(questionRepository: questioRepo)
        default:
            throw QuizSessionFactoryError.unknownQuizSession
        }
    }
}
