//
//  LocalQuestionRepository.swift
//  Quiz
//
//  Created by Doran Kayoumi on 15.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class LocalQuestionRepository: QuestionRepository {
    
    private var _questions: [Question]
    private var questionCount: Int
    
    init() {
        self._questions = [
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
        
        self.questionCount = self._questions.count
    }
    
    func fetchQuestion() -> Question {
        return self._questions[Int(arc4random_uniform(UInt32(self.questionCount)))]
    }
}
