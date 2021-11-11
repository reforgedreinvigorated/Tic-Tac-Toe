class Player

    attr_reader :name
    attr_reader :player_marker

    @@player_count = 0

    def initialize(name)
        @name = name
        @player_marker = "X"
        @@player_count += 1

        if @@player_count == 2
            @player_marker = "O"
        end
    end
end