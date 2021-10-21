class Player
  attr_accessor :name
  attr_accessor :id
  attr_accessor :content
  def initialize (player_name, id_value, content_file)
    @name = player_name
    @id = id_value
    @content = File.read(content_file).split("\n")
  end
end