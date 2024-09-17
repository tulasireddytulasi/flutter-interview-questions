import 'dart:collection';

// Puzzle state class
class PuzzleState {
  List<List<int?>> grid;
  int emptyRow, emptyCol;
  int moves = 0;
  PuzzleState? parent; // To track the previous state

  PuzzleState(this.grid, this.emptyRow, this.emptyCol, {this.parent});

  // Get a unique identifier (flatten grid)
  String get id => grid.expand((row) => row).toList().join(',');

  // Check if this state is the goal
  bool isGoal() {
    List<int?> goal = [
      1, 2, 3, 4,
      5, 6, 7, 8,
      9, 10, 11, 12,
      13, 14, 15, null
    ];
    return id == goal.join(',');
  }

  // Generate new states by moving the empty tile
  List<PuzzleState> getNeighbors() {
    List<PuzzleState> neighbors = [];
    List<List<int>> directions = [
      [0, 1], // Right
      [1, 0], // Down
      [0, -1], // Left
      [-1, 0]  // Up
    ];

    for (var direction in directions) {
      int newRow = emptyRow + direction[0];
      int newCol = emptyCol + direction[1];

      if (newRow >= 0 && newRow < 4 && newCol >= 0 && newCol < 4) {
        // Create a copy of the grid
        List<List<int?>> newGrid = grid.map((row) => List<int?>.from(row)).toList();
        // Swap the empty space with the adjacent tile
        newGrid[emptyRow][emptyCol] = newGrid[newRow][newCol];
        newGrid[newRow][newCol] = null;

        neighbors.add(PuzzleState(newGrid, newRow, newCol, parent: this));
      }
    }
    return neighbors;
  }

  // Heuristic (Manhattan distance)
  int getManhattanDistance() {
    int distance = 0;
    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 4; col++) {
        int? value = grid[row][col];
        if (value != null) {
          // Goal position for this value
          int targetRow = (value - 1) ~/ 4;
          int targetCol = (value - 1) % 4;
          distance += (row - targetRow).abs() + (col - targetCol).abs();
        }
      }
    }
    return distance;
  }

  // A* cost function: f(n) = g(n) + h(n)
  int getCost() => moves + getManhattanDistance();
}

// A* Search algorithm
PuzzleState? solvePuzzle(List<List<int?>> startGrid) {
  int emptyRow = 0, emptyCol = 0;

  // Find the empty space
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (startGrid[i][j] == null) {
        emptyRow = i;
        emptyCol = j;
      }
    }
  }

  // Priority queue for A* search
  PriorityQueue<PuzzleState> frontier = PriorityQueue((a, b) => a.getCost().compareTo(b.getCost()));
  // Set to keep track of visited states
  Set<String> visited = {};

  // Initial state
  PuzzleState initialState = PuzzleState(startGrid, emptyRow, emptyCol);
  frontier.add(initialState);

  while (frontier.isNotEmpty) {
    // Get the state with the lowest cost (priority queue)
    PuzzleState currentState = frontier.removeFirst();

    if (currentState.isGoal()) {
      return currentState; // Return the goal state
    }

    // Mark this state as visited
    visited.add(currentState.id);

    // Explore neighbors
    for (PuzzleState neighbor in currentState.getNeighbors()) {
      if (!visited.contains(neighbor.id)) {
        neighbor.moves = currentState.moves + 1;
        frontier.add(neighbor);
      }
    }
  }
  return null; // If no solution is found
}

// Print the solution steps
void printSolution(PuzzleState? state) {
  if (state == null) {
    print("No solution found.");
    return;
  }

  List<PuzzleState> path = [];
  while (state != null) {
    path.add(state);
    state = state.parent;
  }

  for (int i = path.length - 1; i >= 0; i--) {
    print("Move ${path.length - i - 1}:");
    path[i].grid.forEach((row) => print(row));
    print('');
  }
}

void main() {
  List<List<int?>> initialGrid = [
    [1, 5, 12, 10],
    [2, 14, 7, 15],
    [9, 4, 11, 3],
    [13, 6, 8, null]
  ];

  PuzzleState? solution = solvePuzzle(initialGrid);
  printSolution(solution);
}
