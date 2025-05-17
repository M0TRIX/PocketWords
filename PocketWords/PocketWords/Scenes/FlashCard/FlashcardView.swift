//
//  FlashcardView.swift
//  PocketWords
//
//  Created by Ali on 5/16/25.
//
import SwiftUI
import SwiftData

struct FlashcardView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [WordCard]
    @StateObject private var viewModel = FlashcardViewModel()
    @State private var rotateDegree: Double = 0
    @State private var showAddCardSheet: Bool = false
    
    private var progress: Double {
        guard !cards.isEmpty else { return 0 }
        let correctCount = cards.filter { $0.isCorrect }.count
        return Double(correctCount) / Double(cards.count)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ProgressView(value: progress)
                    .progressViewStyle(.linear)
                    .padding(.horizontal)
                    .accessibilityLabel("Progress: \(Int(progress * 100))% complete")
                
                Text("XP: \(viewModel.xp)")
                    .font(.headline)
                    .accessibilityLabel("XP: \(viewModel.xp) points")
                
                if cards.isEmpty {
                    Text("No cards yet. Add one!")
                        .font(.title2)
                        .foregroundColor(.gray)
                } else {
                    ZStack {
                        CardView(
                            text: viewModel.isFlipped ? cards[viewModel.currentCardIndex].meaning : cards[viewModel.currentCardIndex].word,
                            isFlipped: viewModel.isFlipped
                        )
                        .rotation3DEffect(
                            .degrees(viewModel.isFlipped ? 180 : 0),
                            axis: (x: 0, y: 1, z: 0)
                        )
                                                
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                viewModel.isFlipped.toggle()
                            }
                        }
                        .accessibilityLabel(viewModel.isFlipped ? "Meaning: \(cards[viewModel.currentCardIndex].meaning)" : "Word: \(cards[viewModel.currentCardIndex].word)")
                        .accessibilityHint("Tap to flip card")
                    }
                    
                    TextField("Enter meaning", text: $viewModel.userInput)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .accessibilityLabel("Enter the meaning of the word")
                        .accessibilityHint("Type the meaning and press return to submit")
                        .onSubmit {
                            guard viewModel.currentCardIndex < cards.count else { return }
                            let isCorrect = viewModel.checkAnswer(
                                input: viewModel.userInput,
                                correctMeaning: cards[viewModel.currentCardIndex].meaning
                            )
                            cards[viewModel.currentCardIndex].isCorrect = isCorrect
                            viewModel.isCorrectAnswer = isCorrect
                            viewModel.showFeedback = true
                            try? modelContext.save()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(viewModel.showFeedback ? (viewModel.isCorrectAnswer ? Color.green : Color.red) : Color.clear, lineWidth: 2)
                        )
                    
                    HStack {
                        Button("Previous") {
                            if viewModel.currentCardIndex > 0 {
                                viewModel.currentCardIndex -= 1
                                viewModel.isFlipped = false
                                rotateDegree = 0
                                viewModel.resetFeedback()
                            }
                        }
                        .disabled(viewModel.currentCardIndex == 0)
                        
                        Spacer()
                        
                        Button("Next") {
                            if viewModel.currentCardIndex < cards.count - 1 {
                                viewModel.currentCardIndex += 1
                                viewModel.isFlipped = false
                                rotateDegree = 0
                                viewModel.resetFeedback()
                            }
                        }
                        .disabled(viewModel.currentCardIndex == cards.count - 1)
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .navigationTitle("PocketWords")
            .toolbar {
                Button(action: { showAddCardSheet = true }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add new card")
            }
            .sheet(isPresented: $showAddCardSheet) {
                AddCardView()
            }
        }
    }
}

#Preview {
    FlashcardView()
        .modelContainer(for: WordCard.self, inMemory: true)
}
