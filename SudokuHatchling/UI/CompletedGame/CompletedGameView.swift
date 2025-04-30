//
//  CompletedGameView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

struct CompletedGameView: View {
    @Environment(Router.self) var router
    @Binding var appState : AppState
    var body: some View {
        ZStack{
            Text("Completed Game!!")
            Button(action: {
                router.homeRoutes.removeAll()
            }, label: {
                Image(.btnContinue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 318, height: 82)
            })
        }.navigationBarBackButtonHidden()
       
    }
}

#Preview {
   // CompletedGameView(.constant(.authenticated)).environment(Router())
}
