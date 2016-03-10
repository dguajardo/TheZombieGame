class Gun
  attr_accessor :name, :x, :y
  def initialize(name = nil, posx = nil, posy = nil)  
    @name = name  
    @x = posx 
    @y = posy 
  end


end