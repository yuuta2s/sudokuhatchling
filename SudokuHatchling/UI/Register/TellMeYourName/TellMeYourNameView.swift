//
//  TellMeYourNameView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

struct TellMeYourNameView: View {
    @State private var vm = TellMeYourNameViewModel()
    @Binding var appState : AppState
    @Environment(Router.self) var router
    var body: some View {
        ZStack(alignment: .top) {
            Image(.waveLoginRegister)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .top)
            
            VStack(alignment: .center) {
                Spacer()
                VStack{
                    Text("Sudoku")
                        .font(.summaryNotes(size: 70))
                    + Text("\nHatchling")
                        .font(.summaryNotes(size: 44))
                    Image(.wiseOwlIcon).padding(.bottom,30).padding(.top,-20)
                }.padding(.top,-100)
                
                Text("Tell me your name :").font(.summaryNotes(size: 30 ))
                TextField("Username", text: $vm.name)
                    .frame(width: 318,height: 92,alignment: .center)
                    .autocapitalization(.allCharacters)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .underline(pattern: .dash)
                    .background(.white)
                    .font(.summaryNotes(size: 60)).foregroundStyle(.accent)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.accent, lineWidth: 2)
                    )
                Spacer()
                Button(action: {
                    Task{
                        do{
                            try await vm.insertName()
                        }
                        if vm.isNameAdded{
                            appState = .authenticated
                        }
                    }
                }, label: {
                    Image(.btnContinue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 318, height: 82)
                })
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Image(.pattern).scaledToFill()).ignoresSafeArea(edges: .top).navigationBarBackButtonHidden()
    }
}

#Preview {
    TellMeYourNameView(appState: .constant(.unauthenticated)).environment(Router())
}
