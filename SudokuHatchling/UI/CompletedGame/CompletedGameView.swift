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
        @Bindable var router = router
        ZStack{
            Text("Completed Game!!")
            Button(action: {
                appState = .authenticated
            }, label: {
                Image(.btnBack).resizable()
            })
        }
       
    }
}

#Preview {
   // CompletedGameView(.constant(.authenticated)).environment(Router())
}
