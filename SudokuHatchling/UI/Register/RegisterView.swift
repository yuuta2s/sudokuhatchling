//
//  RegisterView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 23/04/2025.
//

import SwiftUI

struct RegisterView: View {
    @Environment(Router.self) var router
    @State var vm = RegisterViewModel()
    
    var body: some View {
        
        
        ZStack{
            VStack(alignment: .center) {
                Text("Sign Up :").font(.summaryNotes(size: 30 ))
                TextField("Email", text: $vm.email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                SecureField("Password", text: $vm.password)
                    .textContentType(.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                
                SecureField("Password", text: $vm.confirmPassword)
                    .textContentType(.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                if let message = vm.userMessage {
                    Text(message)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                Button(action : {
                    Task{
                        do{
                            try await vm.signUp()
                        }
                        if vm.isUserRegistered {
                            router.unAuthRoutes.append(.insertName)
                        }
                    }
                    
                },label: {
                    Image(.btnContinue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 318, height: 82)
                })
            }.background(Image(.waveLoginRegister).resizable().scaledToFill()).frame(maxWidth: .infinity,maxHeight: .infinity)
        }.background(Image(.pattern).scaledToFill()).ignoresSafeArea(edges : .bottom)
    }
    
}

#Preview {
    // RegisterView(appState: .constant(.authenticated)).environment(Router())
}
