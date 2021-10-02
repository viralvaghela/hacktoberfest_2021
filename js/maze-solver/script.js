const SIZE = 20;
const CELL_SIZE = 30;

class Cell {
  constructor(x, y) {
    // Own position
    this.x = x;
    this.y = y;
   
    // Neighbors
    this.north = null;
    this.east = null;
    this.south = null;
    this.west = null;
  }
  
  draw() {
    // Canvas position
    const x = this.x * CELL_SIZE;
    const y = this.y * CELL_SIZE;
    
    // Fill
    noStroke();
    fill(250);
    rect(x, y, CELL_SIZE, CELL_SIZE);
    
    // Walls
    // If there's no neighbor, it means there's a wall in that direction
    strokeWeight(2);
    stroke(0);
        
    if (this.north === null)
      line(x, y, x + CELL_SIZE, y);
    
    if (this.east === null)
      line(x + CELL_SIZE, y, x + CELL_SIZE, y + CELL_SIZE);
    
    if (this.south === null)
      line(x, y + CELL_SIZE, x + CELL_SIZE, y + CELL_SIZE);
    
    if (this.west === null)
      line(x, y, x, y + CELL_SIZE);
  }
  
  // Get list of connected neighbors
  get neighbors() {
    return [
      this.north,
      this.east,
      this.south,
      this.west
    ].filter(Boolean);
  }
}

class Maze {
  constructor() {
    this.create();
  }
  
  // We're gonna create the maze using a Depth-First Search
  // Starting from a random cell, we go in random directions
  // making sure to avoid already visited cells
  // When we reach a dead end we backtrack
  create() {
    const maze = this.maze = [];  
    
    // Create all the cells for the maze
    for (let i = 0; i < SIZE; i++) {
      const row = [];
      for (let j = 0; j < SIZE; j++) {
        const cell = new Cell(i, j);
        row.push(cell);
      }
      maze.push(row);
    }
    
    // Pick a random starting point
    const startX = Math.floor(SIZE * Math.random());
    const startY = Math.floor(SIZE * Math.random());
    let x = startX;
    let y = startY;

    // The history is gonna help us with backtracking
    const history = [];
    history.push(maze[x][y]);
    
    do {
      maze[x][y].visited = true;

      // Create a list of available directions
      // A direction is available if the cell isn't on the outer edge
      // and the neighboring cell hasn't been visited yet
      const directions = [];
      
      if (y - 1 >= 0 && !maze[x][y - 1].visited)
        directions.push('up');

      if (x + 1 < SIZE && !maze[x + 1][y].visited)
        directions.push('right');

      if (y + 1 < SIZE && !maze[x][y + 1].visited)
        directions.push('down');

      if (x - 1 >= 0 && !maze[x - 1][y].visited)
        directions.push('left');
      
      // If there were no available directions we've reached a dead end
      // Go back to the previous cell and try picking a different direction
      if (directions.length === 0)
      {
        const lastCell = history.pop();
        x = lastCell.x;
        y = lastCell.y;
        continue;
      }

      // Pick a random direction between the available ones
      const randomDirectionIndex = Math.floor(Math.random() * directions.length);
      const randomDirection = directions[randomDirectionIndex];
           
      // Connect the cell to the one in the chosen direction
      // and "move" to that cell
      switch (randomDirection)
      {
        case 'up':
          maze[x][y].north = maze[x][y - 1];
          maze[x][y - 1].south = maze[x][y];
          y -= 1;
          break;

        case 'right':
          maze[x][y].east = maze[x + 1][y];
          maze[x + 1][y].west = maze[x][y];
          x += 1;
          break;

        case 'down':
          maze[x][y].south = maze[x][y + 1];
          maze[x][y + 1].north = maze[x][y];
          y += 1;
          break;

        case 'left':
          maze[x][y].west = maze[x - 1][y];
          maze[x - 1][y].east = maze[x][y];
          x -= 1;
          break;
      }
      
      // Save the cell in the history
      // in case we need to backtrack
      history.push(maze[x][y]);
      
    } while (history.length > 0);
    // If we run out of history it means we've already visited every single cell
    // and we're done
  }
  
  // Solver uses a standard Breadth-First Search (BFS)
  // It checks all the cells with distance 1 from the start
  // then all the cells with distance 2 and so on
  // remembering the "path" taken to get to each cell.
  // When we get to the ending cell we can walk backwards to get the solution
  // The algorithm isn't super efficient, but it's guaranteed to get an optimal solution
  solve() {
    const queue = [];
    const startingCell = this.maze[0][0];
    const endingCell = this.maze[SIZE - 1][SIZE - 1];
    
    queue.push(startingCell);
    
    // While the queue isn't empty (it shouldn't happen unless there's no solution)
    while(queue[0] !== endingCell) {
      const current = queue.shift();
      
      // If we've reached the ending cell we're done
      if (current === endingCell) {
        break;
      }
      
      // Otherwise add all of the neighbors to the queue
      // Setting this cell as their parent
      for(const cell of current.neighbors) {
        if (!cell.parent) {
          cell.parent = current;
          queue.push(cell);
        }
      }
    }
    
    // Time to rebuild the solution
    this.solution = [];
    
    // Starting from the ending cell we're gonna go backwards to each
    // cell parent, until we reach the starting cell
    let current = endingCell;
    while (current !== startingCell) {
      this.solution.push(current);
      current = current.parent;
    }
    
    // We actually need to add the starting cell to the solution
    // And reverse it so it describes the path from the start to the end
    this.solution.push(startingCell);
    this.solution.reverse();
    
    return this.solution;
  }
  
  draw() {
    // Draw each cell
    for(let row of this.maze) {
      for(let cell of row) {
        cell.draw();
      }
    }
    
    // Now draw the solution we've found
    beginShape();
    noFill();
    stroke(255, 0, 0);
    for(let cell of this.solution) {
      const x = (cell.x + 0.5) * CELL_SIZE;
      const y = (cell.y + 0.5) * CELL_SIZE;
      vertex(x, y);
    }
    endShape();
  }
}

let maze;

function setup() {
  createCanvas(SIZE * CELL_SIZE, SIZE * CELL_SIZE);

  maze = new Maze();
  maze.solve();

  noLoop();
}

function draw() {
  maze.draw();
}