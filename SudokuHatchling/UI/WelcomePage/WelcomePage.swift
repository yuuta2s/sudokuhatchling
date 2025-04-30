//
//  WelcomePage.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 18/04/2025.
//

import SwiftUI

struct WelcomePage: View {
    @Environment(Router.self) var router
    @Binding var appState : AppState
    @AppStorage("isFirstVisit") var isPresented : Bool = true
    @State var vm = WelcomePageViewModel()

    

    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path : $router.homeRoutes) {
            ZStack(alignment: .bottom) {
                Image(.waveWelcome)
                    .resizable()
                    .scaledToFit()
                    
                    .frame(maxWidth: .infinity, alignment: .bottom)
                
                VStack(){
                    Text("Welcome to")
                        .font(.custom("Summary Notes", size: 40))
                        .foregroundColor(.black)
                    
                    Image("LogoSudoku")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    
                    Image("OwlStart")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    Text("Crack the puzzles, spread your wings,\nand become a Sudoku master!")
                        .font(.custom("Summary Notes", size: 28 ))
                        .foregroundColor(.black)
                    
                    
                    Button(action: {
                        router.homeRoutes.append(.chooseDifficulty)
                    }) {
                        Image(.btnLetsStart)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 318, height: 82)
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                    .lineSpacing(0)
                    .foregroundStyle(.black)
                    .navigationDestination(for: HomeRoute.self) { route in
                        route.destination(appState: $appState)
                    }
                    .fullScreenCover(isPresented: $isPresented, content: {
                        OnBoarding(isPresented: $isPresented)
                    })
            }.frame(maxWidth: .infinity,maxHeight: .infinity).ignoresSafeArea(edges: .bottom)
        }
        
        Button(action: {
            Task{
                do{
                    try await vm.logout()
                }
                appState = .unauthenticated
            }
        }, label: {
            Text("Log out")
        })
        
        
    }
}

#Preview {
    WelcomePage(appState: .constant(.authenticated), isPresented: false).environment(Router())
}


private extension WelcomePage{
    
    func signOut() async throws{
        do {
            try await supabase.auth.signOut()
        }catch let error{
            print(error.localizedDescription)
            throw error
        }
    }
}


