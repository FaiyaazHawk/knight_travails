class Node
    attr_accessor :parent, :position, :children

    def initialize(parent,position)
        @parent = parent
        @position = position
        @children = []
    end
end

class KnightTravails

    MOVES = [[1,2],[2,1],[1,-2],[2,-1],[-1,2],[-2,1],[-1,-2],[-2,-1]].freeze

    def knight_moves(start_pos,end_pos)
        visited = []
        queue = []
        knight = Node.new(nil,start_pos)

        until knight.position == end_pos
            visited.concat(knight.position)
            knight.children = valid_children(knight.position,visited)
            queue.concat(knight.children)
            knight = Node.new(knight, queue.shift)
        end
        p knight
        #find_home(knight,start_pos,end_pos)    
    end

    def valid_children(position,visited)
        result = []
        
        result = MOVES.map{|move| [position[0] + move[0], position[1] + move[1]]} #generating possible moves
        
        result.keep_if{|move| valid?(move)} #keeping moves that are on the board
                       
        result = result - visited  #removing visited nodes     
        
        return result
    end
    
    def valid?(position)
        if position[0].between?(1,8) && position[1].between?(1,8)
            return true
        else
            return false
        end
    end

    def find_home(knight, start_pos, end_pos)
        path = []
        
        until knight.position == start_pos
            path << knight.position
            knight = knight.parent
        end
        puts "The knight takes #{path.length} moves to get from #{start_pos} to #{end_pos}"
        puts 'Here is the path taken'
        until path.empty?
            p path.unshift
        end
    end


end
knight = KnightTravails.new
p knight.knight_moves([3,3],[4,3])