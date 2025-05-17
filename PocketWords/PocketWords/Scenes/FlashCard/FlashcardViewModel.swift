//
//  Untitled.swift
//  PocketWords
//
//  Created by Ali on 5/16/25.
//

import SwiftUI

class FlashcardViewModel: ObservableObject {
    @Published var userInput: String = ""
    @Published var showFeedback: Bool = false
    @Published var isCorrectAnswer: Bool = false
    @Published var xp: Int = 0
    private let xpPerCorrectAnswer = 10
    
    @Published var currentCardIndex: Int = 0
    @Published var isFlipped: Bool = false
    
    func checkAnswer(input: String, correctMeaning: String) -> Bool {
        let isCorrect = input.trimmingCharacters(in: .whitespaces).lowercased() == correctMeaning.lowercased()
        if isCorrect {
            xp += xpPerCorrectAnswer
        }
        return isCorrect
    }
    
    func resetFeedback() {
        showFeedback = false
        userInput = ""
    }
    
    func previousCard(totalCards: Int) {
        if currentCardIndex > 0 {
            currentCardIndex -= 1
            isFlipped = false
            resetFeedback()
        }
    }
    
    func nextCard(totalCards: Int) {
        if currentCardIndex < totalCards - 1 {
            currentCardIndex += 1
            isFlipped = false
            resetFeedback()
        }
    }
    
    func progress(for cards: [WordCard]) -> Double {
        guard !cards.isEmpty else { return 0 }
        let correctCount = cards.filter { $0.isCorrect }.count
        return Double(correctCount) / Double(cards.count)
    }
}
