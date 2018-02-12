//
//  LocalQuizSession.swift
//  Quiz
//
//  Created by Doran Kayoumi on 12.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class LocalQuizSession: QuizSession {

    internal var _score: Int
    private var questions: [Question]
    private var currentIndex: Int
    
    internal var score: Int {
        get {
            return self._score
        }
    }
    
    internal var questionCount: Int {
        get {
            return self.questions.count
        }
    }
    
    internal var currentQuestion: Question {
        get {
            return self.questions[currentIndex]
        }
    }
    
    init () {
        self.questions = [
            Question(
                caption: "2+2",
                answers: ["1", "2", "4"],
                correctAnswer: "4",
                hint: "A toddler could answer these questions...."
            ),
            Question(
                caption: "Meaning of life?",
                answers: ["God", "42", "Me"],
                correctAnswer: "42",
                hint: "Is there really a meaning to life ?"
            ),
            Question(
                caption: "May the Force be with you",
                answers: ["Star wars", "Forest Gump", "American pie"],
                correctAnswer: "Star wars",
                hint: "You for real ?"
            )
        ]
        self.currentIndex = -1
        self._score = 0
    }
    
    func nextQuestion() -> Question? {
        if currentIndex+1 >= questions.count {
            return nil
        }
        else {
            currentIndex += 1
            return questions[currentIndex]
        }    }
    
    func checkAnswer(_ answer: String) -> Bool {
        let result: Bool = questions[currentIndex].isCorrectAnswer(answer)
        if result {
            self._score += 1
        }
        return result
    }
    
    /*
    override init() {
        
        super.init()
        super.questions = [
            Question(
                caption: "2+2",
                answers: ["1", "2", "4"],
                correctAnswer: "4",
                hint: "A toddler could answer these questions...."
            ),
            Question(
                caption: "Meaning of life?",
                answers: ["God", "42", "Me"],
                correctAnswer: "42",
                hint: "Is there really a meaning to life ?"
            ),
            Question(
                caption: "May the Force be with you",
                answers: ["Star wars", "Forest Gump", "American pie"],
                correctAnswer: "Star wars",
                hint: "You for real ?"
            )
        ]
    }
 */
    
}
