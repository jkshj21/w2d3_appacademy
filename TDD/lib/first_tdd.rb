require "rspec"

class Array
  attr_reader :start_date, :end_date

  def my_uniq
    self.uniq
  end

  def two_sum

    pairs = []
    self.each_index do |idx|
      self.each_index do |jdx|
         if self[idx] + self[jdx] == 0
           pairs << [idx, jdx] if idx != jdx && !pairs.include?([idx,jdx].sort())
         end
      end
    end
    pairs
  end

  def my_transpose
    return nil if self.length <= 0
    self.transpose
  end

  def stock_picker(arr)
    pair = []
    profitable_value = 0
    arr.length.times do |idx|
      arr.length.times do |jdx|

        if profitable_value < (arr[jdx]-arr[idx]) && idx < jdx
          profitable_value = arr[idx] - arr[jdx]
          pair = [idx,jdx]
        end
      end
    end
    @start_date = pair[0]
    @end_date = pair[1]
    pair

  end
end

class TowersOfHanoi

  attr_reader :stack

  def initialize
    @stack = [[1, 2, 3], [], []]
  end

  def play
    # display
    until won?
      puts "what block are you taking from"
      start = gets.chomp

      puts "what block are you taking from"
      finish = gets.chomp

      if valid_move?(start, finish)
        make_move(start, finish)
      else
        raise "Invalid move"
      end

    end
  end

  def won?
    @stack[0].empty? && (@stack[1].length == 3 || @stack[2].length == 3)
  end


  def valid_move?(input_start, input_end)
    return false if [input_start, input_end].any? {|i| i > 2 || i < 0} 
    return false if @stack[input_start].empty?
    return false if @stack[input_start].last < @stack[input_end].last
    return true

    # return false unless [input_start, input_end].all? { |i| i.between?(0, 2) } &&
    # !@stack[input_start].empty? && (@stack[input_end].empty? ||@stack[input_end].last > @stack[input_start].last)
  end

  def make_move(start, finish)
    removed = @stack[start].pop
    @stack[finish] << removed
  end



end
