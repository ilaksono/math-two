require './Express'

class Game 
  attr_accessor :ans, :game_loop, :p1, :p2

  def game_loop p1, p2
    while p1.num_lives > 0 && p2.num_lives > 0 do
      ans1 = self.ask_q("Player 1")
      real_ans1 = self.get_ans
      puts compare_ans(real_ans1, p1, "Player 1"){ans1}
      puts "P1: #{p1.num_lives}/3 vs P2: #{p2.num_lives}/3"
      puts "----- NEW TURN -----"
      ans2 = self.ask_q("Player 2")
      real_ans2 = self.get_ans
      puts compare_ans(real_ans2, p2, "Player 2"){ans2}
      puts "P1: #{p1.num_lives}/3 vs P2: #{p2.num_lives}/3"
      puts "----- NEW TURN -----"
    end
    if p1.num_lives
      puts "Player 1 Wins with a score of #{p1.num_lives}/3"
    else
      puts "Player 2 Wins with a score of #{p2.num_lives}/3"  
    end
    puts "----- GAME OVER -----\nGood Bye!"
  end

  def get_ans
    puts " > "
    gets.chomp.to_i
  end

  def compare_ans ans, player, player_name
    if ans == yield
      return "YES! You are correct"
    else
      player.lose_life
      return "#{player_name}: Seriously? No!"
    end
  end

  def say_q player, expression
    return "#{player}: #{expression}"
  end
  
  def ask_q player_name
    a = rand() * 20
    b = rand() * 20
    exp = Express.new(a.to_i,b.to_i).expression
    puts self.say_q player_name, exp
    return a.to_i + b.to_i
  end
end

