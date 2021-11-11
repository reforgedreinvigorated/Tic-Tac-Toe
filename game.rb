require_relative "board"
class Game
    attr_reader :winner
    def initialize
        @winner = "none"
    end

    def is_there_a_winner?(board, player)

        vertical_arr = [[board[0][0], board[1][0], board[2][0]], [board[0][1], board[1][1], board[2][1]], [board[0][2], board[1][2], board[2][2]]]
        diagonal_arr = [[board[0][0], board[1][1], board[2][2]], [board[0][2], board[1][1], board[2][0]]]

        # win by vertical line
        if vertical_arr[0].all? {|cell| cell == player.player_marker} || vertical_arr[1].all? {|cell| cell == player.player_marker} || vertical_arr[2].all? {|cell| cell == player.player_marker}
            return true
        #win by horizontal line
        elsif board[0].all? {|cell| cell == player.player_marker} || board[1].all? {|cell| cell == player.player_marker} || board[2].all? {|cell| cell == player.player_marker}
            return true
        #win by diagonal
        elsif diagonal_arr[0].all? {|cell| cell == player.player_marker} || diagonal_arr[1].all? {|cell| cell == player.player_marker}
            return true
        end
        #no winner
        return false
       # end
    end

    def winner=(player)
        @winner = player.name
    end
end