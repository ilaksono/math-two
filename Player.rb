class Player 
  attr_accessor :num_lives, :name
  def initialize n
    @num_lives = 3
    @name = n
  end
  
  def lose_life
    @num_lives -= 1
  end

  def lose_game
    if @num_lives == 0
      game.end
    end
  end
end

