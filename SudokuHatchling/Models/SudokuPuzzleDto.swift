//
//  SudokuPuzzleDto.swift
//  SudokuHatchling
//
//  Created by Asmaâ on 23/04/2025.
//

import Foundation

struct SudokuPuzzle : Codable{
    let uuid : String
    let problem_grid : [[Int]]
    let solution_grid : [[Int]]
    let difficulty : String
}
