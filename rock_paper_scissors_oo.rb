# rock_papaer_scissors_oo.rb
#
# Tealeaf Course 1 -- Lesson 2 Assignment
# 7/2/2015

class DataValidation

  def self.options_include?(options = ['Y', 'N'], choose)
    choose = choose.upcase
    options.include?(choose)
  end

  def self.continue_next(choose)
    choose = choose.upcase
    choose == 'Y'
  end

end

class Player
  attr_accessor :hand, :name

  def initialize(name)
    @name = name    
  end

end

class Human < Player

  def pick_hand
    begin 
      puts "Choose one: (P/R/S)"
      your_choose = gets.chomp
    end while !DataValidation.options_include?(options = Game::GAME_OPTIONS.keys, choose = your_choose)

    self.hand = your_choose.upcase    
  end

end

class Computer < Player
  def pick_hand
    choice = Game::GAME_OPTIONS.keys.sample
    self.hand = choice
  end
end

class Game
  GAME_OPTIONS = {'P' => 'Paper', 'R' => 'Rock', 'S' =>'Scissors'}

  attr_accessor :player, :computer

  def initialize(name)
    @player = Human.new("Vic")
    @computer = Computer.new("Computer")
  end

  def you_win
    if player.hand == 'P'
      if computer.hand == 'R'
        you_win = true
      else
        you_win = false
      end
    elsif player.hand == 'R'
      if computer.hand == 'S'
        you_win = true
      else
        you_win = false
      end
    elsif player.hand == 'S'
      if computer.hand == 'P'
        you_win = true
      else
        you_win = false
      end      
    end
  end

  def compare_hand
    if player.hand == computer.hand
      puts "It's a tie."

    elsif you_win
      puts "#{GAME_OPTIONS[player.hand]} wraps #{GAME_OPTIONS[computer.hand]}!"
      puts "You won!"
    else
      puts "#{GAME_OPTIONS[computer.hand]} wraps #{GAME_OPTIONS[player.hand]}!"
      puts "Computer won!"
    end
  end
  
  def play
    system 'clear'
    puts "Play Paper Rock Scissors! #{player.name}"

    begin
      self.player.pick_hand
      self.computer.pick_hand

      puts "You picked #{GAME_OPTIONS[player.hand]} and computer picked #{GAME_OPTIONS[computer.hand]}."
    
      compare_hand

      begin 
        puts "Play again? (Y/N)"
        continue = gets.chomp
      end while !DataValidation.options_include?(choose = continue)
    end while DataValidation.continue_next(continue)

  end
end

game = Game.new('Vic')

game.play




