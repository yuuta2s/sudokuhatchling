//
//  RegisterViewModel.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 23/04/2025.
//

import Foundation

@Observable
class RegisterViewModel : ObservableObject{
    
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var userMessage : String?
    var isUserRegistered : Bool = false
    
    func SignUp() async throws{
        if password != confirmPassword{
            userMessage = "Les mots de passe ne sont pas identiques"
            return
        }
        do {
            try await supabase.auth.signUp(email: email.lowercased(), password: password)
            isUserRegistered = true
            userMessage = "Inscription réussie"
        } catch {
            userMessage = "Erreur d'inscription: \(error.localizedDescription)"
        }
    }
    
    
}


