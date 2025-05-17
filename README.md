# PocketWords

PocketWords is a single-screen iPhone app for learning vocabulary using flashcards. Users can add cards, flip them to view word/meaning, input answers, receive feedback, and track XP progress, with data persisted locally via SwiftData.
Architecture

MVVM Pattern: Separates concerns into Model (WordCard.swift), ViewModel (FlashcardViewModel.swift), and Views (PocketWordsApp.swift, FlashcardView.swift, CardView.swift, AddCardView.swift).
Model: WordCard (@Model) stores word, meaning, and correctness, persisted with SwiftData.
ViewModel: FlashcardViewModel manages answer checking, XP, card navigation, flip state, and progress computation.
View: SwiftUI views handle UI rendering, with @State for animation (rotateDegree) and modal presentation (showAddCardSheet). @Query and @Environment fetch SwiftData entities reactively.
Tests: FlashcardViewModelTests.swift verifies answer-checking logic.

link of screen record : 

[](https://limewire.com/decrypt?downloadUrl=https%3A%2F%2Flimewire-filesharing-production.b61cdfd8cf17f52ddc020162e738eb5d.r2.cloudflarestorage.com%2Fbuckets%2Fbea72822-6562-4ac2-86b2-0a1174125bbe%2F641db035-858b-4016-a931-537590954d0c%3FX-Amz-Algorithm%3DAWS4-HMAC-SHA256%26X-Amz-Date%3D20250517T101215Z%26X-Amz-SignedHeaders%3Dhost%26X-Amz-Credential%3Da1868571dfad6d4fe293ee5b945a0ad5%252F20250517%252Fauto%252Fs3%252Faws4_request%26X-Amz-Expires%3D14400%26X-Amz-Signature%3D3a8a7dec2008509fa943f081dc89f89567c3066d7358b4ce7b730451019c0d4f&mediaType=video%2Fquicktime&decryptionSession=eyJhZXNKd2tHY20iOnsiYWVzS2V5VHlwZSI6IlNZTU1FVFJJQ19BRVMtR0NNX0tFWSIsImp3ayI6eyJhbGciOiJBMjU2R0NNIiwiZXh0Ijp0cnVlLCJrIjoiZGplaWJnVmNIOUIwSjA0cnBhRG9fWFMxOU1feTE0M2x1a09ISV9EVTVrbyIsImtleV9vcHMiOlsiZW5jcnlwdCIsImRlY3J5cHQiXSwia3R5Ijoib2N0In19LCJhZXNKd2tDdHIiOnsiYWVzS2V5VHlwZSI6IlNZTU1FVFJJQ19BRVMtQ1RSX0tFWSIsImp3ayI6eyJhbGciOiJBMjU2Q1RSIiwiZXh0Ijp0cnVlLCJrIjoiZGplaWJnVmNIOUIwSjA0cnBhRG9fWFMxOU1feTE0M2x1a09ISV9EVTVrbyIsImtleV9vcHMiOlsiZW5jcnlwdCIsImRlY3J5cHQiXSwia3R5Ijoib2N0In19fQ)
