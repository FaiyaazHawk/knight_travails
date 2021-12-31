class Node
    attr_accessor :parent, :position, :children

    def initialize(parent,position)
        @parent = parent
        @position = position
        @children = []
    end
end

class KnightTravails

    MOVES = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]].freeze

    def knight_moves(start_pos,end_pos)
        visited = []
        queue = []
        knight = Node.new(nil,start_pos)

        until knight.position == end_pos
            visited += knight.position
            
            knight.children = valid_children(knight.position,visited) #valid by checking if child is valid on board and if previously visited
            
            queue +=(knight.children) #adding children to queue
            
            knight = Node.new(knight, queue.shift) #changing current knight to front of queue
            
        
        end
        p knight.parent
        #find_home(knight)    
    end

    def valid_children(position,visited)
        result = []
        
        result = MOVES.map{|move| [position[0] + move[0], position[1] + move[1]]} #generating possible moves
                .keep_if{|move| valid?(move)} #keeping moves that are on the board
                       
        return result = result - visited  #removing visited positions 
            
        
        
    end
    
    def valid?(position)
        if position[0].between?(1,8) && position[1].between?(1,8)
            return true
        else
            return false
        end
    end

    def find_home(knight)
        path = []
        
        until knight.parent.nil?
            path += knight.position
            knight = knight.parent
        end
        puts "The knight takes #{path.length} moves to get from start position to end position"
        puts 'Here is the path taken'
        p path
    end


end
knight = KnightTravails.new
p knight.knight_moves([1,1],[2,3])