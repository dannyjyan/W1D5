require_relative 'PolyTreeNode/lib/00_tree_node.rb'

class KnightPathFinder
  KNIGHT_MOVES = [
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1, 2],
    [1, -2],
    [1, 2],
    [2, -1],
    [2, 1]
  ]
  

  def initialize(pos)
    @start_pos = pos
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
  end

  def new_move_positions(pos)
    valid = KnightPathFinder.valid_moves(pos) - considered_positions
  end
  
  def self.valid_moves(pos)
    valid = []
    x, y = pos
    KNIGHT_MOVES.each do |move| 
      next_x, next_y = x+move[0], y+move[1]
      next if next_x < 0 || next_x > 7 || next_y < 0 || next_y > 7
      valid << [next_x, next_y]
    end  
    valid
  end
  
  def build_move_tree

  end
  
end