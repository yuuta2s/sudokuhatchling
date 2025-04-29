//
//  Button+Custom.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 25/04/2025.
//

import SwiftUI

struct ButtonCustom: View {
    var text : String = "YESSSSSSS"
    var action : () -> Void = {}
    var body: some View {
        Button(action: {
       //     Image(.backButton).resizable()
        }){
         //   action
        }
    }
}

#Preview {
    ButtonCustom()
}
