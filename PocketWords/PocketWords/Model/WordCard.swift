//
//  WordCard.swift
//  PocketWords
//
//  Created by Ali on 5/16/25.
//
import SwiftData

@Model
class WordCard {
    var word: String
    var meaning: String
    var isCorrect: Bool = false
    
    init(word: String, meaning: String) {
        self.word = word
        self.meaning = meaning
    }
}
