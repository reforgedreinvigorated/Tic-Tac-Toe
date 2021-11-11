class Board
    attr_accessor :board
    attr_accessor :cells_filled
    def initialize
        @board = new_grid
        @@cells_filled = 0
    end

    def to_s
        "#{board[0][0]}|#{board[0][1]}|#{board[0][2]}\n#{board[1][0]}|#{board[1][1]}|#{board[1][2]}\n#{board[2][0]}|#{board[2][1]}|#{board[2][2]}"
    end

    def get_cell_selection(num)
        row = 0
        col = 0
        case num
        when 2
            col = 1
        when 3
            col = 2
        when 4
            row = 1
        when 5
            row = 1
            col = 1
        when 6
            row = 1
            col = 2
        when 7
            row = 2
        when 8
            row = 2
            col = 1
        when 9
            row = 2
            col = 2
        end
        [row, col]
    end

    def can_mark?(num, player_marker)
        arr = get_cell_selection(num)
        row = arr[0]
        col = arr[1]
        # player has already marked it
        unless @board[row][col] == num
            return false
        end
        set_cell(row, col, player_marker)
        @@cells_filled += 1
        return true
    end

    def set_cell(row, col, player_marker)
        @board[row][col] = player_marker
    end

    private

    def new_grid
        [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end
end