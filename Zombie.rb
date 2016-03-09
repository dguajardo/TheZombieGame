class Zombie
  attr_accessor :name, :x, :y

  def initialize(name = nil, posx = nil, posy = nil)
    @name = name || 'Némesis'
    @x = posx || Random.rand(10)
    @y = posy || Random.rand(10)
  end

  def walk
    @x += Random.rand(-1..1)
    @y += Random.rand(-1..1)
  end

  def to_s
    'Brainnnssss!!!!'
  end

end
