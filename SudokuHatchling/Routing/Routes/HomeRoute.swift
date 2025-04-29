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
    func destination(appState : Binding<AppState>)-> some View{
        switch self{
        case .chooseDifficulty:
            ChooseDifficultyView()
        case .game(_):
            SudokuGrid()
        case .completedGame:
            CompletedGameView(appState: appState)
        }
    }
}
