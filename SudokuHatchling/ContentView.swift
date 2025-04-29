//
//  ContentView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 16/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isFirstSplashDone = false
    @State private var isSplashShowing = true
    @State private var appState : AppState = .splash
    @State private var isPresented : Bool = false
    
    var body: some View {
        Group{
            switch appState {
            case .splash :
                SplashView(isFirstSplashDone: $isFirstSplashDone).onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isFirstSplashDone = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        isSplashShowing = false
                        let userISignedIn = checkIfLogged()
                        
                        if userISignedIn && checkIfFirstVisit(){
                            isPresented = true
                        }
                        appState = userISignedIn ? .authenticated : .unauthenticated
                    }
                }
            case .authenticated :
                WelcomePage(appState: $appState, isPresented: isPresented)
            case .unauthenticated :
                LoginView(appState: $appState)
            }
        }
        
    }
}

private extension ContentView{
    
    private func checkIfLogged()-> Bool{
        if supabase.auth.currentSession != nil{
            return true
        }else{
            return false
        }
    }
    
    private func checkIfFirstVisit() -> Bool {
        let isFirstVisit = !UserDefaults.standard.bool(forKey: "notFirstVisit")
        if isFirstVisit {
            UserDefaults.standard.set(true, forKey: "notFirstVisit")
        }
        return isFirstVisit
    }
}

enum AppState{
    case authenticated
    case unauthenticated
    case splash
}
