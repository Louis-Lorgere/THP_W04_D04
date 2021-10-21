class Boardcase
  attr_accessor :content, :ownership, :name

  def initialize case_name
    @name = case_name
    @content = File.read("#{__dir__}/../../src/empty_case.txt").split("\n")
    @ownership = 0
  end

end