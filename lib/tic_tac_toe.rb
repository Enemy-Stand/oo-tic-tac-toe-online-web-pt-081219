require "pry"

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
  
  def move(index, user_input = "X")
    @board[index] = user_input
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
end