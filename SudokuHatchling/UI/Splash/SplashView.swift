//
//  SplashView.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 22/04/2025.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var isFirstSplashDone : Bool
    var body: some View {
        
        if isFirstSplashDone == true {
            makeSecondSplash()
        } else {
           makeFirstSplash()
        }
     
    }
}

private extension SplashView {
    private func makeFirstSplash() -> some View {
        ZStack{
            Color(.primary).ignoresSafeArea()
            Image(.splashEggs)
        }
    }
    
    private func makeSecondSplash() -> some View {
            VStack(spacing : 38){
                Image(.logoSplash)
                Text("Sudoku")
                    .font(.summaryNotes(size: 100))
                + Text("\nHatchling")
                    .font(.summaryNotes(size: 44))
                Spacer()
                Image(.splashEggs)
            }
            .padding(.top, 40)
            .padding(.bottom, 20)
            .multilineTextAlignment(.center)
            .lineSpacing(0)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .background{
                Image(.waveSplash)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .top)}
    }
}

#Preview {
    SplashView(isFirstSplashDone: .constant(true))
}

