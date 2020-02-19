let size = 8
var board = Board(size: size)
var cols = [Bool](repeating: true, count: size)

print("1. Print  all possible ways to place 8 queens on 8x8 chessboard.")
solveQueens1(board: &board, row: 0, cols: &cols)

print("2. Print the first possible way to place 8 queens on the 8x8 board with less than 115 recursive calls. Stop immediately as soon as you find the first solution.")
_ = solveQueens2(board: &board, row: 0, cols: &cols)
print("Number of recursive calls: \(recursionCount)")
// need to initialize before re-use these
// board = Board(size: size)
// cols = [Bool](repeating: true, count: size)
