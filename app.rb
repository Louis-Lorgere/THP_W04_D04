require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/board'
require 'app/boardcase'
require 'app/game'
require 'app/player'
require 'views/display.rb'

class Application
  
  def rules
    puts "Les règles du morpions sont simples"
    puts "Pour gagner aligner trois de vos pièces avant votre adversaire"
    puts "(soit horizontalement, soit verticalement soit en diagonales)"
    puts
    puts "Taper :"
    puts "1 - Pour commencer une partie de morpion"
    puts "2 - pour quitter"
    print "> "
  end

  def initialize
    rules
    user_input = gets.chomp
    while (user_input != "1" && user_input != "2")
      print "> "
      user_input = gets.chomp
    end
    while user_input == "1"
      system("clear")
      game = Game.new
      system("clear")
      puts "Taper 1 pour rejouer ou 2 pour quitter"
      user_input = gets.chomp
      while (user_input != "1" && user_input != "2")
        user_input = gets.chomp
      end
    end
    puts "Auf Wiedersehen"
  end
end

def process
  app = Application.new
end

process