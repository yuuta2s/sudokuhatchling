//
//  TellMeYourName+ViewModel.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import Foundation

@Observable
class TellMeYourNameViewModel{
    
    
    func insertName(name: String) async throws{
        _ = try await supabase.from("users_profiles").insert(name).execute()
    }
}
