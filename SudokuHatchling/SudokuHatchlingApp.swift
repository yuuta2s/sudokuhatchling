//
//  SudokuHatchlingApp.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 16/04/2025.
//

import SwiftUI

@main
struct SudokuHatchlingApp: App {
    @State private var router = Router()
    var body: some Scene {
        WindowGroup {
           ContentView().environment(router)
        }
    }
}
