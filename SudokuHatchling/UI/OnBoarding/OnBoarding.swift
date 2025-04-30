//
//  OnBoardingCommonComponent.swift
//  SudokuHatchling
//
//  Created by  on 18/04/2025.
//


import SwiftUI

struct OnBoarding: View {
    
    @Environment(Router.self) var router
    @Binding var isPresented: Bool
    @State var onBoardingStep: OnBoardingStep = .onboardingStep1
     var steps : [OnBoardingStep] = OnBoardingStep.fullOnboarding
    
    
    var body: some View {

        VStack(spacing: 30){
            Text(onBoardingStep.title)
                .font(.summaryNotes(size: 32))
                .padding(.top,30)
                .padding(.bottom, 20)
            
            onBoardingStep.imageFeatureName
                .resizable()
                .scaledToFit()
                .padding(.bottom,38)
            
            Text(onBoardingStep.bottomText)
                .font(.summaryNotes(size: 28))
                .multilineTextAlignment(.center)
                .fontWeight(.bold).padding(.bottom,20)
            
            onBoardingStep.imagePaginationName
            
            Spacer()
            Button(action: {
                guard let index = steps.firstIndex(of: onBoardingStep) else { return }
                if index < steps.count - 1{
                    self.onBoardingStep = steps[index + 1]
                }else if index == steps.lastIndex(of: onBoardingStep) {
                  isPresented = false
                }
            }) {
                Image(.btnNext)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 318, height: 82)
            }
            
            if onBoardingStep.shouldShowBackButton {
                Button(action: {
                    guard let index = steps.firstIndex(of: onBoardingStep) else { return }
                    if index > 0 {
                        self.onBoardingStep = steps[index - 1]
                    }
                }) {
                    Image(.btnBack)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 318, height: 82)
                }
            }
        }.frame(maxHeight: .infinity)
            .background(  VStack {
                Spacer()
                Image(.waveOnBoarding)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
            } .ignoresSafeArea(edges: .bottom))
    }
}


#Preview {
    OnBoarding(isPresented: .constant(true)).environment(Router())
}


enum OnBoardingStep : CaseIterable{
    case onboardingStep1
    case onboardingStep2
    case onboardingStep3
    
    static let fullOnboarding = OnBoardingStep.allCases
    
    var title: String {
        switch self {
        case .onboardingStep1: "Progressive Sudoku Challenges"
        case .onboardingStep2: "Daily Egg Hunt"
        case .onboardingStep3: "Night Owl Mode"
        }
    }
    
    var bottomText: String {
        switch self {
        case .onboardingStep1: "Grow from Eggshell to Wise Owl \nas you solve puzzles \ndesigned for every skill level!"
        case .onboardingStep2: "Crack hidden rewards every day \n with our Daily Egg Hunt!"
        case .onboardingStep3: "Solve Sudoku in puzzles style, \n day or night!"
        }
    }
    
    var imageFeatureName: Image {
        switch self {
        case .onboardingStep1: Image(.featureOB1)
        case .onboardingStep2: Image(.featureOB2)
        case .onboardingStep3: Image(.featureOB3)
        }
    }
    
    var imagePaginationName: Image{
        switch self {
        case .onboardingStep1: Image(.paginationOB1)
        case .onboardingStep2: Image(.paginationOB2)
        case .onboardingStep3: Image(.paginationOB3)
        }
    }
    
    var shouldShowBackButton: Bool {
        switch self {
        case .onboardingStep1:
            return false
        default:
            return true
        }
    }
    
    
}
