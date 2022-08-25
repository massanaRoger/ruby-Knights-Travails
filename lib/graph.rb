# frozen_string_literal: true

class Graph
  def initialize
    @matrix = initialize_matrix
    @knight_moves = []
  end

  def put_knight(x, y)
    moves = []
    moves.push([x + 2, y + 1]) if x + 2 < 8 && y + 1 < 8
    moves.push([x + 2, y - 1]) if x + 2 < 8 && (y - 1) >= 0
    moves.push([x + 1, y + 2]) if x + 1 < 8 && y + 2 < 8
    moves.push([x + 1, y - 2]) if x + 1 < 8 && (y - 2) >= 0
    moves.push([x - 1, y + 2]) if (x - 1) >= 0 && y + 2 < 8
    moves.push([x - 1, y - 2]) if (x - 1) >= 0 && (y - 2) >= 0
    moves.push([x - 2, y + 1]) if (x - 2) >= 0 && y + 1 < 8
    moves.push([x - 2, y - 1]) if (x - 2) >= 0 && (y - 1) >= 0
    moves
  end

  def BFS(start, fin)
    q = []
    q.push(start);
    visited = Array.new(8) {Array.new(8, false)};
    visited[start[0]][start[1]] = true
    result = []
    npaths = 0
    #result[npaths] = [start]
    while (q.length != 0) do
      vis = q[0];
      q.shift;
      i = 0
      j = 0
      result.push(vis)
      while i < 8 do
        while j < 8 do
         # if [i, j] == fin
          #  return result
            #result[npaths].push([i, j])
            #result.push(Marshal.load(Marshal.dump(result[npaths])))
            #npaths += 1
         # end
          if put_knight(vis[0], vis[1]).include?(fin)
            result.push(fin)
            return result
          elsif put_knight(vis[0], vis[1]).include?([i, j])  && !visited[i][j]
            q.push([i, j])
            visited[i][j] = true
          #else
            #result[npaths].pop
          end
          j += 1
        end
        j = 0
        i += 1
      end
    end
    #final_arr = Array.new(1000)
    #result.flatten(1).each{|arr| final_arr = arr if arr.length < final_arr.length}
    #final_arr
    result
  end

  private

  def initialize_matrix
    @matrix = Array.new(8) { Array.new(8, 1) }
    for index in 0..7
      @matrix[index][index] = 0
    end
  end
end
