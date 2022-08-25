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
p graph.BFS([0,0],[1,2])
p graph.BFS([0,0],[3,3])
p graph.BFS([3,3],[0,0])
