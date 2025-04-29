//
//  CompletedGameView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

struct CompletedGameView: View {
    @Environment(Router.self) var router
    var body: some View {
        @Bindable var router = router
        Text("Completed Game!!")
    }
}

#Preview {
    CompletedGameView().environment(Router())
}
