//
//  Factory.swift
//  Quiz
//
//  Created by Doran Kayoumi on 12.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class Factory {
    static func newQuizSession(type: String) throws -> QuizSession {
        switch type {
            case "local":
                return LocalQuizSession()
            case "rest":
                return RestQuizSession()
            default:
                throw NSError()
        }
    }
}
