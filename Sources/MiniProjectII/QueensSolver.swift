//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

func solveQueens1(board: inout Board, row: Int, cols: inout [Bool]) {
  for (col, valid) in cols.enumerated() {
    guard valid && board.isDiagonallySafe(row: row, col: col) else {
      continue
    }
    board.place(row: row, col: col)
    cols[col] = false
    if row + 1 == board.size {
      print(board)
    } else {
      solveQueens1(board: &board, row: row + 1, cols: &cols)
    }
    board.remove(row: row, col: col)
    cols[col] = true
  }
}

var recursionCount = 0
func solveQueens2(board: inout Board, row: Int, cols: inout [Bool]) -> Bool {
  recursionCount += 1
  for (col, valid) in cols.enumerated() {
    guard valid && board.isDiagonallySafe(row: row, col: col) else {
      continue
    }
    board.place(row: row, col: col)
    cols[col] = false
    if row + 1 == board.size {
      print(board)
      return true
    } else if solveQueens2(board: &board, row: row + 1, cols: &cols) {
      return true
    }
    board.remove(row: row, col: col)
    cols[col] = true
  }
  return false
}
