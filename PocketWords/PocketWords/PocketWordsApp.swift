//
//  PocketWordsApp.swift
//  PocketWords
//
//  Created by Ali on 5/16/25.
//

import SwiftUI

@main
struct PocketWordsApp: App {
    var body: some Scene {
        WindowGroup {
            FlashcardView()
                .modelContainer(for: WordCard.self)
        }
    }
}
