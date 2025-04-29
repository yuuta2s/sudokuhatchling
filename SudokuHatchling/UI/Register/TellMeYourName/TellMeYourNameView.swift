//
//  TellMeYourNameView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

struct TellMeYourNameView: View {
    @State private var name: String = ""
    @State private var vm = TellMeYourNameViewModel()
    @Environment(Router.self) var router
    var body: some View {
        @Bindable var router = router
        ZStack(alignment: .top) {
            Image(.waveLoginRegister)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .top)
               
            VStack(alignment: .center) {
                VStack{
                    Text("Sudoku")
                        .font(.summaryNotes(size: 70))
                    + Text("\nHatchling")
                        .font(.summaryNotes(size: 44))
                    Image(.wiseOwlIcon).padding(.bottom,30).padding(.top,-20)
                }
                
                Text("Tell me your name :").font(.summaryNotes(size: 30 ))
                TextField("Username", text: $name)
                    .frame(width: 318,height: 92,alignment: .center)
                    .autocapitalization(.allCharacters)
                    .autocorrectionDisabled(true)
                    .underline(pattern: .dash)
                    .background(.white)
                    .padding([.leading, .trailing], 10)
                    .font(.summaryNotes(size: 60)).foregroundStyle(.accent)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.accent, lineWidth: 2)
                    )
                Button(action: {
                    Task{
                        do{
                            try await vm.insertName()
                        }
                    }
                }, label: {
                    Text("Continue").foregroundStyle(.black).font(.summaryNotes(size: 32))
                })
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
               
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Image(.pattern).scaledToFill()).ignoresSafeArea()
    }
}

#Preview {
    TellMeYourNameView().environment(Router())
}
