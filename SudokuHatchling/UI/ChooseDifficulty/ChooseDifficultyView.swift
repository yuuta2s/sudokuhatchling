//
//  ChooseDifficultyView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 22/04/2025.
//

import SwiftUI

struct ChooseDifficultyView: View {
   @Environment(Router.self) var router
    
    var body: some View {
        @Bindable var router = router
        VStack{
            Text("CHOOSE DIFFICULTY !")
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    ChooseDifficultyView().environment(Router())
}
