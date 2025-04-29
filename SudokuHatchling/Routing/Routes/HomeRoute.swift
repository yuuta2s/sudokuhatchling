//
//  HomeRoute.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

enum HomeRoute: Hashable{
    case chooseDifficulty, game(String), completedGame
    
    @ViewBuilder
    var destination: some View{
        switch self{
        case .chooseDifficulty:
            ChooseDifficultyView()
        case .game(_):
            SudokuGrid()
        case .completedGame:
            CompletedGameView()
        }
    }
}
