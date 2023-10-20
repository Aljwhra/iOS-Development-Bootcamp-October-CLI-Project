//
//  main.swift
//  Quiz CLI App
//
//  Created by Abdullah Aljahdali on 19/10/2023.
//

import Foundation

// 
enum error : Error {
    case invalidInput
}

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
            print("\(index + 1). \(option)")
        }

        print("Your answer: ", terminator: "")
        
        if let userAnswer = readLine()  {
            do{
                let answer = try check(userAnswer, question)
                if answer == question.correctAnswer {
                    print("Correct!\n")
                    score += 1
                } else {
                    print("Wrong. The correct answer is: \(question.options[question.correctAnswer - 1])\n")
                }
            }catch{
                print("error : \(error)")
            }
        }
    }

    func check(_ input: String, _ question: Question)throws -> Int {
        if let answer = Int(input), answer >= 1 , answer <= question.options.count{
            
            return answer
        }else {
            throw error.invalidInput
        }
    }
    
    
    
    mutating func startQuiz() {
        for question in questions.shuffled() {
            askQuestion(question)
        }
        print("Quiz completed. Your score: \(score) out of \(questions.count)")
    }
}

// Example usage:
let questions = [
    Question(text: "What does 'var' mean in Swift?", options: ["Variable", "Value", "Vector"], correctAnswer: 1),
    Question(text: "What is the result of 2 + 3?", options: ["4", "5", "6"], correctAnswer: 2),
    Question(text: "Can this code be updated: 'let x = 5'?", options: ["true","false"], correctAnswer: 2),
    Question(text: "There is no difference between 'repeat' and 'while'?", options: ["true","false"], correctAnswer: 2),
    Question(text: "Texts can be combined using the '+' sign?", options: ["true","false"], correctAnswer: 1),
    Question(text: "Swift is an open-source programming language?", options: ["true","false"], correctAnswer: 1)
]

var quiz = Quiz(questions: questions)
quiz.startQuiz()





