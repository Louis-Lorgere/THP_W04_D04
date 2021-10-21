class Game
  attr_accessor :board, :player1, :player2, :display, :winner

  def initialize
    @winner = 0
    @display = Display.new
    @display.title
    @display.player_name_creation(1)
    user_name = gets.chomp
    @player1 = Player.new(user_name, 1, "#{__dir__}/../../src/o_case.txt")
    @display.player_name_creation(2)
    user_name = gets.chomp
    @player2 = Player.new(user_name, 2, "#{__dir__}/../../src/x_case.txt")
    @board = Board.new
    system("clear")
    @display.board(@board)
    puts @player1.id
    start()
    if (@winner == 0)
      puts "Dommage... Égalité... Faut faire des progrès...\n"
    elsif (@winner == 1)
      puts "Bien joué #{@player1.name} tu l'as démonté" 
    else
      puts "Bien joué #{@player2.name} tu l'as démonté"
    end
    sleep 3
  end

  def check_availability_case case_name
    boardcase = @board.cases.select{|boardcase| boardcase.name == case_name}
    if boardcase.any? == false || boardcase[0].ownership != 0
      print "Cette case n'est pas disponible\n> "
      return false
    end
    return true
  end

  def add_piece_to_board (case_name, player)
    boardcase = @board.cases.select{|boardcase| boardcase.name == case_name}
    boardcase[0].ownership = player.id
    boardcase[0].content = player.content
  end

  def player_turn (player)
    display.player_turn(player)
    player_input = gets.chomp
    while (check_availability_case(player_input)  == false)
      player_input = gets.chomp
    end
    add_piece_to_board(player_input, player)
  end

  def start
    while (is_won? == false && is_full? == false)
      player_turn(@player1)
      system("clear")
      @display.board(@board)
      if (is_won? == false && is_full? == false)
        player_turn(@player2)
        system("clear")
        @display.board(@board)
      end
    end
  end

  def check_line (case_1, case_2, case_3)
    if case_1.ownership != 0 && case_1.ownership == case_2.ownership && case_1.ownership == case_3.ownership
      @winner = case_1.ownership
      return true
    else
      return false
    end
  end

  def check_rows(board)
    i = 0
    3.times do
      if check_line(board.cases[i], board.cases[i + 1], board.cases[i + 2])
        return true
      end
      i += 3
    end
    return false
  end

  def check_columns(board)
    i = 0
    3.times do
      if check_line(board.cases[i], board.cases[i + 3], board.cases[i + 6])
        return true
      end
      i += 1
    end
    return false
  end

  def check_diagonals (board)
    if check_line(board.cases[0], board.cases[4], board.cases[8])
      return true
    end
    if check_line(board.cases[2], board.cases[4], board.cases[6])
      return true
    end
    return false
  end

  def is_won?
    if check_rows(@board)
      return true
    elsif check_columns(@board)
      return true
    elsif check_diagonals(@board)
      return true
    else
      return false
    end
  end

  def is_full?
    @board.cases.each do |x|
      if x.ownership == 0
        return false
      end
    end
    return true
  end
end