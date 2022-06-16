# frozen_string_literal: true

class Node
  attr_accessor :parent, :position, :children

  def initialize(parent, position)
    @parent = parent
    @position = position
    @children = []
  end
end

class KnightTravails
  MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze

  def knight_moves(start_pos, end_pos)
    visited = []
    queue = []
    knight = Node.new(nil, start_pos)

    until knight.position == end_pos
      visited << knight
      knight.children = valid_children(knight) # valid by checking if child is valid on board
      queue += knight.children # adding children to queue
      queue -= visited # removing visited positions from queue
      knight = queue.shift # changing current knight to front of queue

    end

    find_path(knight, start_pos, end_pos)
  end

  def valid_children(knight)
    result = []

    result = MOVES.map { |move| [knight.position[0] + move[0], knight.position[1] + move[1]] } # generating possible moves
                  .keep_if { |move| valid?(move) } # keeping moves that are on the board
                  .map { |move| Node.new(knight, move) }

    result
  end

  def valid?(position)
    if position[0].between?(1, 8) && position[1].between?(1, 8)
      true
    else
      false
    end
  end

  def find_path(knight, start_pos, end_pos)
    path = []

    until knight.parent.nil?
      path << knight.position
      knight = knight.parent
    end
    puts "The knight takes #{path.length} moves to get from #{start_pos} to #{end_pos}"
    puts 'Here is the path taken'
    start_pos + path.reverse
  end
end
knight = KnightTravails.new
p knight.knight_moves([3, 3], [4, 3])
