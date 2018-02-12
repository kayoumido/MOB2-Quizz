//
//  QuizSession.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import Foundation

protocol QuizSession {
    var score: Int { get }
    var questionCount: Int { get }
    var currentQuestion: Question { get }
    
    func nextQuestion() -> Question?
    func checkAnswer(_ answer: String) -> Bool
}
