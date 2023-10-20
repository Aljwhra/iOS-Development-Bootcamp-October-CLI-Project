//
//  main.swift
//  Quiz CLI App
//
//  Created by Abdullah Aljahdali on 19/10/2023.
//

import Foundation

//
struct Question {
    let text: String
    let options: [String]
    let correctAnswer: Int
}

struct Quiz {
    let questions: [Question]
    var score = 0
    
    
    mutating func askQuestion(_ question: Question) {
        print(question.text)
        for (index, option) in question.options.enumerated() {
            print("\(index+1). \(option)")
        }
        
        print("Your answer: ", terminator: "")
        if let userAnswer = readLine(), let answer = Int(userAnswer) {
            if answer == question.correctAnswer {
                print("Correct!\n")
                score += 1
            } else {
                print("Wrong. The correct answer is: \(question.options[question.correctAnswer - 1])\n")
            }
        }
    }
}




