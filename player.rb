class Player
  attr_accessor :name, :blood, :manna

  def initialize name
    @name = name
    @blood = 100
    @manna = 40
  end
  def attack
    @manna -= 5
  end
  def defend
    @blood -= 20
  end
end
