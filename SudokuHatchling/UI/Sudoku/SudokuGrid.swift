//
//  SudokuGrid.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 18/04/2025.
//
import SwiftUI

struct SudokuGrid: View {
    @Environment(Router.self) var router
    @State var vm = SudokuViewModel()
    @State var selectedCell : SelectedCell = SelectedCell(masterGridindex: 0, valueIndex: 0)
    @State var isCellSelected : Bool = false
    @State var numEntered : Int = 0
    @State var isSolved : Bool = false
    @State private var errorCells: Set<[Int]> = []
    
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline){
                Button(action: {
                    router.homeRoutes.removeLast()
                }, label: {
                    Image(.closeButton)
                        .resizable()
                        .scaledToFit().frame(width: 36,height: 36)
                }).padding(.leading,40)
                
                Text("Eggshell Level").font(.summaryNotes(size: 20)) //niveau récup + difficulty (un autre enum)
                Spacer()
            }
            if !vm.sudokuGrid.isEmpty{
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(20)), count: 9),spacing: 0) {
                    ForEach(0..<9, id: \.self) { row in
                        VStack(spacing : 0){
                            ForEach(0..<9, id: \.self) { col in
                                let value = vm.sudokuGrid[row][col]
                                Text(value == 0 ? "" : "\(value)")
                                    .frame(width: 30, height: 30)
                                    .background(selectedCell.masterGridindex == row &&
                                                selectedCell.valueIndex == col && value == 0
                                                ? Color.blue.opacity(0.5)
                                                : errorCells.contains([row, col])
                                                ? Color.red.opacity(0.5)
                                                : Color.white)
                                    .onTapGesture{
                                        let cell = [row, col]
                                        if value == 0 || errorCells.contains(cell) {
                                            selectedCell = SelectedCell(masterGridindex: row, valueIndex: col)
                                            isCellSelected = true
                                        } else {
                                            isCellSelected = false
                                        }
                                    }.border(Color.gray)
                            }
                        }
                    }
                }
                .padding()
            } else {
                Text("Pas de grille pour l'instant..!")
                    .padding()
            }
            showNumButtons()
            
            Button(action: {
                solveSudokuGrid()
            }, label: {
                Image(.btnSolve)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 318, height: 82)
            }).padding(.top,40)
        }
        .onAppear {
            Task{
                vm.getFakeGrid()
            }
        }.navigationBarBackButtonHidden()
    }
}

private extension SudokuGrid {
    private func solveSudokuGrid() {
        errorCells.removeAll()
        
        var hasEmptyCells = false
        for row in 0..<9 {
            for col in 0..<9 {
                let currentValue = vm.sudokuGrid[row][col]
                if currentValue == 0 {
                    hasEmptyCells = true
                } else if currentValue != vm.solvedGrid[row][col] {
                    errorCells.insert([row, col])
                }
            }
        }
        
        if errorCells.isEmpty && !hasEmptyCells {
            isSolved = true
            goToCompleted()
            print("Grille complétée \(isSolved)")
        } else {
            isSolved = false
            print("Grille erronée ou incomplète")
        }
    }
    
    private func goToCompleted(){
        router.homeRoutes.append(.completedGame)
    }
    
    private func showNumButtons()-> some View{
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(60)), count: 5),spacing: 10){
            ForEach(1...10, id: \.self) { num in
                Button(action: {
                    if isCellSelected{
                        vm.sudokuGrid[selectedCell.masterGridindex][selectedCell.valueIndex] = num
                    }
                    if num == 10 {
                        vm.sudokuGrid[selectedCell.masterGridindex][selectedCell.valueIndex] = 0
                    }
                    
                    
                }, label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 60, height: 60)
                        
                        if num == 10 {
                            Image(systemName: "delete.left")
                                .foregroundStyle(.black)
                        } else {
                            Text("\(num)")
                                .foregroundStyle(.black)
                                .font(.headline)
                        }
                    }
                }
                )
            }
        }
    }
}



#Preview{
    SudokuGrid().environment(Router())
}

