//
//  CardView.swift
//  PocketWords
//
//  Created by Ali on 5/16/25.
//
import SwiftUI

struct CardView: View {
    let text: String
    let isFlipped: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 5)
            .overlay(
                Text(text)
                    .font(.title)
                    .padding()
                    .rotation3DEffect(
                    .degrees(isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
            )
            .frame(width: 300, height: 200)
    }
}
