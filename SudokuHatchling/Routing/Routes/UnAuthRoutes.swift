//
//  UnAuthRoutes.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

enum UnAuthRoutes: Hashable{
    
    
    case signIn,signUp
    
    @ViewBuilder
    func destination(appState: Binding<AppState>) -> some View{
        switch self{
        case .signIn:
            LoginView()
        case .signUp:
            RegisterView()
        }
    }
}


