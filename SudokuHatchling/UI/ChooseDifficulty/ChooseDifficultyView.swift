//
//  ChooseDifficultyView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 22/04/2025.
//

import SwiftUI

struct ChooseDifficultyView: View {
    @Environment(Router.self) var router
    @State private var selectedDifficulty: Difficulty = .beginner

    var body: some View {
        @Bindable var router = router
        VStack() {
            Text("Choose Your Challenge Level:")
                .font(.summaryNotes(size: 36)).padding(.top,60)

            ForEach(Difficulty.allCases) { difficulty in
                DifficultyRadioButton(difficulty: difficulty, selectedDifficulty: $selectedDifficulty)
            }

            Button(action: {
                print("Difficulté sélectionnée : \(selectedDifficulty.realValue)")
                router.homeRoutes.append(.game(selectedDifficulty.realValue))
            }){
                Image(.btnContinue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 318, height: 82)
            }
            .padding(.bottom, 30)
        }
        .padding()
        .background(Image(.waveDifficulty).resizable().scaledToFit())
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ChooseDifficultyView().environment(Router())
}

enum Difficulty : CaseIterable,Hashable,Identifiable{
    case beginner,easy,intermediate,advanced,expert
    
    var id : Self {self}
    
    var difficultyName:String{
        switch self {
        case .beginner:
            return "Eggshell"
        case .easy:
            return "Cracked"
        case .intermediate:
            return "Chick"
        case .advanced:
            return "Fledgeling"
        case .expert:
            return "Wise Owl"
        }
    }
    
    var smallTitle:String{
        switch self {
        case .beginner:
            return "(Beginner)"
        case .easy:
            return "(Easy)"
        case .intermediate:
            return "(Intermediate)"
        case .advanced:
            return "(Advanced)"
        case .expert:
            return "(Expert)"
        }
    }
    
    var difficultyIcon: Image{
        switch self {
        case .beginner:
            return Image(.eggshellIcon)
        case .easy:
            return Image(.crackedIcon)
        case .intermediate:
            return Image(.chickIcon)
        case .advanced:
            return Image(.fledgelingIcon)
        case .expert:
            return Image(.wiseOwlIcon)
        }
    }
    
    var realValue: String{
        switch self {
        case .beginner:
            return "beginner"
        case .easy:
            return "easy"
        case .intermediate:
            return "intermediate"
        case .advanced:
            return "advanced"
        case .expert:
            return "expert"
        }
    }
}
