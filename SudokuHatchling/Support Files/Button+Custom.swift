//
//  Button+Custom.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

struct DifficultyRadioButton: View {
    let difficulty: Difficulty
    @Binding var selectedDifficulty: Difficulty

    var body: some View {
        Button(action: {
            selectedDifficulty = difficulty
        }) {
            HStack(spacing:32) {
                difficulty.difficultyIcon
                    .resizable()
                    .frame(width: 50, height: 60).padding()

                VStack(alignment: .leading, spacing: 2) {
                    Text(difficulty.difficultyName)
                        .font(.summaryNotes(size: 32))
                    Text(difficulty.smallTitle)
                        .font(.summaryNotes(size: 16))
                        .foregroundColor(.gray)
                }
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color.accentColor, lineWidth: 2)
                        .background(Circle().fill(Color.white))
                        .frame(width: 30, height: 30)
                        .shadow(color: .gray, radius: 3, x: 0, y: 1)
                        .padding()
                        

                    if selectedDifficulty == difficulty {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 12, height: 12)
                    }
                }

              
            }
            .padding(8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
#Preview {
    DifficultyRadioButton(difficulty: .beginner, selectedDifficulty: .constant(.beginner))
}
