//
//  PocketWordsTests.swift
//  PocketWordsTests
//
//  Created by Ali on 5/16/25.
//

import XCTest
@testable import PocketWords

class FlashcardViewModelTests: XCTestCase {
    func testCheckAnswer() {
        let viewModel = FlashcardViewModel()
        
        // Test correct answer
        let isCorrect = viewModel.checkAnswer(input: "Big", correctMeaning: "big")
        XCTAssertTrue(isCorrect, "Answer should be correct for matching strings (case-insensitive)")
        XCTAssertEqual(viewModel.xp, 10, "XP should increase by 10 for correct answer")
        
        // Test incorrect answer
        let isIncorrect = viewModel.checkAnswer(input: "Small", correctMeaning: "big")
        XCTAssertFalse(isIncorrect, "Answer should be incorrect for non-matching strings")
        XCTAssertEqual(viewModel.xp, 10, "XP should not increase for incorrect answer")
        
        // Test whitespace handling
        let isCorrectWithWhitespace = viewModel.checkAnswer(input: "  big  ", correctMeaning: "big")
        XCTAssertTrue(isCorrectWithWhitespace, "Answer should be correct with trimmed whitespace")
        XCTAssertEqual(viewModel.xp, 20, "XP should increase by 10 for correct answer with whitespace")
    }
}
