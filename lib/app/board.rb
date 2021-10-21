class Board
  attr_accessor :cases

  def initialize
    @cases = Array.new
    3.times do |i|
      @cases.push(Boardcase.new("A#{i + 1}"))
    end
    3.times do |i|
      @cases.push(Boardcase.new("B#{i + 1}"))
    end
    3.times do |i|
      @cases.push(Boardcase.new("C#{i + 1}"))
    end
  end
end