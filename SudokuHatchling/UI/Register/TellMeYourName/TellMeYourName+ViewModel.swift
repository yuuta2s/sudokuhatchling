//
//  TellMeYourName+ViewModel.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import Foundation

@Observable
class TellMeYourNameViewModel{
    var name: String = ""
    var userMessage : String = ""
    var isNameAdded : Bool = false
    
    
    func insertName() async throws{
        
        guard let userId = supabase.auth.currentUser?.id else {
                   userMessage = "Utilisateur non trouvé."
                   throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Utilisateur non trouvé."])
               }
        
        do {
            try await supabase.from("users_profiles")
              .update(["username": name])
              .eq("id", value: userId)
              .execute()
            isNameAdded = true
        }catch let error {
            userMessage = "Erreur d'ajout de nom : \(error)"
            throw error
        }
        
    }
}
