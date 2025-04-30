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
                    .frame(width: 50, height: 60)

                VStack(alignment: .leading, spacing: 2) {
                    Text(difficulty.difficultyName)
                        .font(.summaryNotes(size: 32))
                        .foregroundStyle(.black)

                    Text(difficulty.smallTitle)
                        .font(.summaryNotes(size: 16))
                        .foregroundStyle(.gray)
                }
                Spacer()
                ZStack {
                    Circle()
                        .fill(.shadow(.inner(color: .gray,radius: 3, x: 0,y: 1 )))
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                       
                       
                        
                    if selectedDifficulty == difficulty {
                        Circle()
                            .stroke(.white, lineWidth: 1)
                            .frame(width: 36, height: 36)
                        
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 20, height: 20)
                    }
                }

              
            }
        }
       
    }
}
#Preview {
    DifficultyRadioButton(difficulty: .beginner, selectedDifficulty: .constant(.beginner)).background(.accent)
}
