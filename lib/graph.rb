# frozen_string_literal: true

class Graph
  def initialize
    @root = nil
    @knight_moves = []
  end

  def put_knight(x, y)
    @knight_moves.push([x + 2, y + 1]) if x + 2 < 8 && y + 1 < 8
    @knight_moves.push([x + 2, y - 1]) if x + 2 < 8 && (y - 1).positive?
    @knight_moves.push([x + 1, y + 2]) if x + 1 < 8 && y + 2 < 8
    @knight_moves.push([x + 1, y - 2]) if x + 1 < 8 && (y - 2).positive?
    @knight_moves.push([x - 1, y + 2]) if (x - 1).positive? && y + 2 < 8
    @knight_moves.push([x - 1, y - 2]) if (x - 1).positive? && (y - 2).positive?
    @knight_moves.push([x - 2, y + 1]) if (x - 2).positive? && y + 1 < 8
    @knight_moves.push([x - 2, y - 1]) if (x - 2).positive? && (y - 1).positive?
  end
end
