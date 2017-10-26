require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 , @name2 = name1, name2
    @cups = Array.new(14) {Array.new()}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 or idx == 13
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if @cups[start_pos] == []
    raise 'Invalid starting cup' if !start_pos.between?(0,13)
  end


  def make_move(start_pos, current_player_name)
    moving = []
    moving = @cups[start_pos]
    @cups[start_pos] = []
    # byebug
    idx = start_pos
    num_moves = moving.length
    counter = 0
    until counter == num_moves
      idx += 1
      if idx == 14
        idx = 0
      end

      if current_player_name == @name1 && idx == 13
        idx = 0
      elsif current_player_name == @name2 && idx == 6
        idx = 7
      end
      @cups[idx] << moving.shift

      counter +=1
    end

    render
    # byebug
    next_turn(idx)



  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    # byebug
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length  == 1
      return :switch
    elsif @cups[ending_cup_idx].length > 1
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}

  end

  def winner
    final = @cups[6].length <=> @cups[13].length
    case final
    when 0
      return :draw
    when -1
      return @name2
    when 1
      return @name1
    end
  end
end
