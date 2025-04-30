//
//  LoginViewModel.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 16/04/2025.

import Foundation

@Observable
class LoginViewModel : ObservableObject{
    var email: String = ""
    var password: String = ""
    var userMessage : String?
    var isUserConnected : Bool = false
    var isLoading : Bool = false
    
    func signIn() async {
        
        do {
            try await supabase.auth.signIn(email: email, password: password)
            await MainActor.run {
                isUserConnected = true
            }
        } catch {
            self.userMessage = error.localizedDescription
        }
        
        
    }
    
   
}
