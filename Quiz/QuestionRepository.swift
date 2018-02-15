//
//  QuestionRepository.swift
//  Quiz
//
//  Created by Doran Kayoumi on 15.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

protocol QuestionRepository {
    
    func fetchQuestion() -> Question
}
