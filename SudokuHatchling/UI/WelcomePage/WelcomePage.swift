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
    @State var isPresented : Bool
    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path : $router.homeRoutes) {
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

                    Text("Crack the puzzles, spread your wings,\n and become a Sudoku master!")
                        .font(.custom("Summary Notes", size: 28 ))
                        .foregroundColor(.black)

                    Button(action: {
                        router.homeRoutes.append(.game("beginner"))
                    }) {
                        Image(.letsStartButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 318, height: 82)
                    }
                    
                    Button(action: {
                        Task{
                           try await signOut()
                            print("c bon")
                            appState = .unauthenticated
                        }
                    }) {
                        Image(.backButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 318, height: 82)
                    }
                
                }.padding(.bottom, 20)
                .multilineTextAlignment(.center)
                .lineSpacing(0)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .background(
                    Image(.waveLoginRegister)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .top))
                .navigationDestination(for: HomeRoute.self) { route in
                    route.destination
                }
                .fullScreenCover(isPresented: $isPresented, content: {
                    OnBoarding(isPresented: $isPresented)
                })
                  
            }
           
    }
}

#Preview {
    WelcomePage(appState: .constant(.authenticated), isPresented: true).environment(Router())}


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
