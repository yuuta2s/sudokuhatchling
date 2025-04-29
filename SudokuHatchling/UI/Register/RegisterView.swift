//
//  RegisterView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 23/04/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = "Azmaâ"
    @Environment(Router.self) var router
    var body: some View {
        @Bindable var router = router
        ZStack{
            VStack(alignment: .center) {
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
                Button(action : {
                   // router.homeRoutes.append(.welcome)
                },label: {
                    Text("Continue").font(.summaryNotes(size: 38)).foregroundStyle(.red)
                })
            }.background(Image(.waveLoginRegister).resizable().scaledToFill()).frame(maxWidth: .infinity,maxHeight: .infinity)
        }.background(Image(.pattern).scaledToFill()).ignoresSafeArea(edges : .bottom)
    }
       
}

#Preview {
    RegisterView().environment(Router())
}
