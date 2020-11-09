require './game'
require './express'
require './player'

game = Game.new
p1 = Player.new('Player 1')
p2 = Player.new('Player 2')
game.game_loop(p1, p2)