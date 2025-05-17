//
//  AddCardView.swift
//  PocketWords
//
//  Created by Ali on 5/16/25.
//
import SwiftUI
import SwiftData

struct AddCardView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var word: String = ""
    @State private var meaning: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Word", text: $word)
                    .accessibilityLabel("Enter word")
                TextField("Meaning", text: $meaning)
                    .accessibilityLabel("Enter meaning")
            }
            .navigationTitle("Add Card")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newCard = WordCard(word: word, meaning: meaning)
                        modelContext.insert(newCard)
                        try? modelContext.save()
                        dismiss()
                    }
                    .disabled(word.isEmpty || meaning.isEmpty)
                }
            }
        }
    }
}
