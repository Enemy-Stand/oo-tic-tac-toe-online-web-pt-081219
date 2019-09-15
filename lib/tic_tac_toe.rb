require 'pry'

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i-1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false || nil
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    if turn_count%2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
  end
  
  def turn
    puts "Enter a number between 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
    binding.pry
    if valid_move?(index)
      move(index, token)
    else
      puts "Invalid move, try aagain"
      turn
    end
    display_board
  end
  
  # def check_win_combination?(current_player, win_combo)
  #   win_combo.all? do |position|
  #     @board[position] == current_player
  #   end
  # end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if position_taken?(win_combo[0])
        if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
        return win_combo
        end
      end
    end
    false
  end
  
  def full?
    @board.none? do |position|
      position == " "
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won?
  end
  
  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end
  
  def play
    until over?
    turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      return nil
    end
  end
end