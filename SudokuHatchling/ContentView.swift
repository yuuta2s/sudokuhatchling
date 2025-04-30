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
    @AppStorage("isFirstVisit") var isFirstVisit : Bool = true
    
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
                        appState = userISignedIn ? .authenticated : .unauthenticated
                        checkFirstVisit()
                    }
                }
            case .authenticated :
                WelcomePage(appState: $appState, isPresented: isFirstVisit)
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
    
    private func checkFirstVisit(){
        if UserDefaults.standard.object(forKey: "isFirstVisit") == nil{
            UserDefaults.standard.set(true, forKey: "isFirstVisit")
         }
    }
    
}

enum AppState{
    case authenticated
    case unauthenticated
    case splash
}

