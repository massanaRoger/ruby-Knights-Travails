# frozen_string_literal: true

class Graph
  def initialize
    @matrix = initialize_matrix
    @knight_moves = []
  end

  def put_knight(x, y)
    moves = []
    moves.push([x + 2, y + 1]) if x + 2 < 8 && y + 1 < 8
    moves.push([x + 2, y - 1]) if x + 2 < 8 && (y - 1).positive?
    moves.push([x + 1, y + 2]) if x + 1 < 8 && y + 2 < 8
    moves.push([x + 1, y - 2]) if x + 1 < 8 && (y - 2).positive?
    moves.push([x - 1, y + 2]) if (x - 1).positive? && y + 2 < 8
    moves.push([x - 1, y - 2]) if (x - 1).positive? && (y - 2).positive?
    moves.push([x - 2, y + 1]) if (x - 2).positive? && y + 1 < 8
    moves.push([x - 2, y - 1]) if (x - 2).positive? && (y - 1).positive?
    moves
  end

  def BFS(start)
    q = []
    q.push(start);
    visited = Array.new(8) {Array.new(8, false)};
    visited[start[0]][start[1]] = true
    while (q.length != 0) do
      vis = q[0];
      puts "#{vis} ";
      q.shift;
      i = 0
      j = 0
      while i < 8 do
        while j < 8 do
          if put_knight(vis[0], vis[1]).include?([i, j])  && !visited[i][j]
            q.push([i, j])
            visited[i][j] = true
          end
          j += 1
        end
        j = 0
        i += 1
      end
    end
  end

  private

  def initialize_matrix
    @matrix = Array.new(8) { Array.new(8, 1) }
    for index in 0..7
      @matrix[index][index]  = 0
    end
  end
end
