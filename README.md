# PocketWords

PocketWords is a single-screen iPhone app for learning vocabulary using flashcards. Users can add cards, flip them to view word/meaning, input answers, receive feedback, and track XP progress, with data persisted locally via SwiftData.
Architecture

MVVM Pattern: Separates concerns into Model (WordCard.swift), ViewModel (FlashcardViewModel.swift), and Views (PocketWordsApp.swift, FlashcardView.swift, CardView.swift, AddCardView.swift).
Model: WordCard (@Model) stores word, meaning, and correctness, persisted with SwiftData.
ViewModel: FlashcardViewModel manages answer checking, XP, card navigation, flip state, and progress computation.
View: SwiftUI views handle UI rendering, with @State for animation (rotateDegree) and modal presentation (showAddCardSheet). @Query and @Environment fetch SwiftData entities reactively.
Tests: FlashcardViewModelTests.swift verifies answer-checking logic.

