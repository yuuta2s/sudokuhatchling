//
//  WelcomePageViewModel.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 30/04/2025.
//

import Foundation
import Combine
import Supabase

@Observable
class WelcomePageViewModel{
    var userMessage : String?
    var isUserConnected : Bool = false
    
    func logout() async throws{
        do {
            try await supabase.auth.signOut()
            isUserConnected = false
            userMessage = "Utilisateur bien déconnecté byeeee"
            print(isUserConnected.description)
        }catch let error{
            userMessage = "Erreur de deconnexion: \(error.localizedDescription)"
            print(error.localizedDescription)
            throw error
        }
        
    }
}
