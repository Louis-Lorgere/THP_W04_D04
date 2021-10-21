class Display

  def title
    title = File.read("#{__dir__}/../../src/title.txt")
    puts title
    puts "<<<<<    Bienvenue dans le jeu de morpion du cursus THP   >>>>>\n\n"
  end

  def player_name_creation player_number
    puts "\nComment le joueur n.#{player_number} s'appelle-t-il ?\n"
    print '> '
  end

  def player_turn (player)
    puts "À toi de jouer #{player.name}"
    puts "Tape le nom d'une des cases vides pour poser ton pion !"
    print "> "
  end

  def board_row_1(board)
    print " " + ("_" * 32) + " \n"  
    print "|A1" +(" " * 8) + "|A2" + (" " * 8) + "|A3" + (" " * 8) + "|\n"
    5.times do |i|
      if (board.cases[0].ownership == 1)
        print "| " + board.cases[0].content[i].red + " | "
      else
        print "| " + board.cases[0].content[i].green + " | "
      end
      if (board.cases[1].ownership == 1)
        print board.cases[1].content[i].red + " | "
      else
        print board.cases[1].content[i].green + " | "
      end
      if (board.cases[2].ownership == 1)
        print board.cases[2].content[i].red + " |\n"
      else
        print board.cases[2].content[i].green + " |\n"
      end
    end
  end

  def board_row_2(board)
    print "|" + ("_" * 10) + "|" + ("_" * 10) + "|" + ("_" * 10) + "|\n"
    print "|B1" +(" " * 8) + "|B2" + (" " * 8) + "|B3" + (" " * 8) + "|\n"
    5.times do |i|
      if (board.cases[3].ownership == 1)
        print "| " + board.cases[3].content[i].red + " | "
      else
        print "| " + board.cases[3].content[i].green + " | "
      end
      if (board.cases[4].ownership == 1)
        print board.cases[4].content[i].red + " | "
      else
        print board.cases[4].content[i].green + " | "
      end
      if (board.cases[5].ownership == 1)
        print board.cases[5].content[i].red + " |\n"
      else
        print board.cases[5].content[i].green + " |\n"
      end
    end
  end

  def board_row_3(board)
    print "|" + ("_" * 10) + "|" + ("_" * 10) + "|" + ("_" * 10) + "|\n"
    print "|C1" +(" " * 8) + "|C2" + (" " * 8) + "|C3" + (" " * 8) + "|\n"
    5.times do |i|
      if (board.cases[6].ownership == 1)
        print "| " + board.cases[6].content[i].red + " | "
      else
        print "| " + board.cases[6].content[i].green + " | "
      end
      if (board.cases[7].ownership == 1)
        print board.cases[7].content[i].red + " | "
      else
        print board.cases[7].content[i].green + " | "
      end
      if (board.cases[8].ownership == 1)
        print board.cases[8].content[i].red + " |\n"
      else
        print board.cases[8].content[i].green + " |\n"
      end
    end
    print "|" + ("_" * 10) + "|" + ("_" * 10) + "|" + ("_" * 10) + "|\n\n"
  end

  def board board
    board_row_1(board)
    board_row_2(board)
    board_row_3(board)    
  end
end