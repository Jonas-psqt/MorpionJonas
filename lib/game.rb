require 'bundler'
Bundler.require

require_relative 'board'
require_relative 'player'

class Game

  def initialize
    @board = Board.new
    @current_player = ""
    @winner = false
    @turn = 0
  end

  def start_game
    names = get_names
    @player1 = Player.new(names[0], :X, @board)
    @player2 = Player.new(names[1], :O, @board)
    @current_player = @player1
    @board.show_board
    turn until @winner || @turn == 9
    if @winner
      puts "#{@winner.name} wins!"
    else
      puts "Draw!"
    end
  end

  private
 
  def turn
    puts "#{@current_player.name}\'s turn. Choose your cell (1-9): "
    choice = gets.chomp.to_i
    if choice > 9 || choice < 1
      puts "warning: number must be betwenn 1 and 9"
    elsif @current_player.move(choice) != false
      @winner = @current_player if @current_player.winner?
      @turn += 1
      switch_player
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def get_names
    puts "Player X name: "
    name1 = gets.chomp
    puts "Player O name: "
    name2 = gets.chomp
    [name1, name2]
  end

end

game = Game.new
game.start_game