require_relative 'player'
require_relative 'board'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new()}
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map!.with_index do |cup, idx|
      cup = [:stone, :stone, :stone, :stone]
    end
    @cups[6] = []
    @cups[13] = []

  end

  def valid_move?(start_pos)
      raise ArgumentError.new "Invalid starting cup" if start_pos.between?(0,13) == false
      raise ArgumentError.new "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # current = current_player_name.side

    suitcase = []
    suitcase, @cups[start_pos] = @cups[start_pos], suitcase

    idx = start_pos + 1
    until suitcase.empty?
      if idx == 14
        idx = 0
      end

      # doing this for now to pass the spec
      # ideally use current_player_name.side to see what side they are on

      if current_player_name == @name1 && idx == 13
        idx = 0
      elsif @current_player_name == @name2 && idx == 6
        idx = 7
      end

      @cups[idx] << suitcase.pop
      idx += 1

    end

    next_turn(idx-1)


  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    render
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    end
    if @cups[ending_cup_idx].count == 1
      return :switch
    elsif
      @cups[ending_cup_idx].count > 1
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
    @cups[0..5].all? {|x| x.empty?} || @cups[7..12].all? {|x| x.empty?}
  end

  def winner
    return :draw if @cups[6].count == @cups[13].count
    if @cups[6].count > @cups[13].count
      return @name1
    elsif @cups[6].count > @cups[13].count
      return @name2
    end
  end
end
