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
    
    var body: some View {
        @Bindable var router = router
        VStack {
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
                                                : Color.white)
                                    .onTapGesture{
                                        if value == 0 {
                                            selectedCell = SelectedCell(masterGridindex: row, valueIndex: col)
                                            isCellSelected = true
                                        }else{
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
                Text("Solve").font(.summaryNotes(size: 32)).foregroundStyle(.red)
            }).padding(.top,40)
        }
        .onAppear {
            Task{
                vm.getFakeGrid()
            }
        }
    }
}

private extension SudokuGrid {
    private func solveSudokuGrid(){
        if vm.sudokuGrid.elementsEqual(vm.solvedGrid){
          isSolved =  true
            goToCompleted()
            print("Grille complétée \(isSolved)")
        }else {
           isSolved = false
            print("Grille erronée")
            
        }
    }
       
    private func goToCompleted(){
        router.homeRoutes.append(.completedGame)
    }
    
    private func showNumButtons()-> some View{
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(50)), count: 5),spacing: 10){
            ForEach(1...10, id: \.self) { num in
                Button(action: {
                    if isCellSelected{
                            vm.sudokuGrid[selectedCell.masterGridindex][selectedCell.valueIndex] = num
                    }
                    if num == 10 {
                        vm.sudokuGrid[selectedCell.masterGridindex][selectedCell.valueIndex] = 0
                    }
                }, label: {
                    if num == 10 {
                        Image(systemName: "delete.left")
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.black)
                            .background(.gray.opacity(0.2))
                        
                    }else{
                        Text("\(num)")
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.black)
                            .background(.gray.opacity(0.2))
                    }})
            }
        }
    }
}



#Preview{
    SudokuGrid().environment(Router())
}

