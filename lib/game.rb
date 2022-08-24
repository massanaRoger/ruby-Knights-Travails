# frozen_string_literal: true

require_relative 'graph'
class Game
  def initialize
    @board = Array.new(8) { Array.new(8, 0) }
    @knight = [0, 0]
  end
end

game = Game.new
graph = Graph.new
graph.put_knight(0, 0)
graph.BFS([1, 1])
