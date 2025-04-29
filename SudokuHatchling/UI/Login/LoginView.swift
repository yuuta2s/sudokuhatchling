//
//  LoginView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 17/04/2025.
//

import SwiftUI

struct LoginView: View {
    @Bindable private var vm = LoginViewModel()
    @Environment(Router.self) private var router
    @Binding var appState : AppState

    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.unAuthRoutes){
            VStack(spacing: 20) {
                
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
                
                if let message = vm.userMessage {
                    Text(message)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                Button(action: {
                    Task{
                          await vm.signIn()
                    }
                }){
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    router.unAuthRoutes.append(.signUp)
                }
                ){
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    Task{
                        do{
                            try await vm.logout()
                        }
                    }
                }, label: {
                    Text("Log out")
                })
                
            }.navigationDestination(for: UnAuthRoutes.self) {
                route in
                route.destination(appState: $appState)
            }
            .padding()
            .onChange(of: vm.isUserConnected){
                if vm.isUserConnected{
                    appState = .authenticated
                }
            }
        }
        
       
    }
  
}


#Preview {
    LoginView(appState: .constant(.unauthenticated)).environment(Router())
}
