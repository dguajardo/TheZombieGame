
class Dog
  attr_accessor :name, :x, :y 

  def initialize(name = nil, posx = nil, posy = nil ) 
    @name = name || 'Dog'
    @x = posx || Random.rand(5)
    @y = posy || Random.rand(5)
  end

  def move                     
    @x += Random.rand(-3..3)
    @y += Random.rand(-3..3)
  end

  def kill (zombies)
  zombies.each do |zombie|
      if zombie.x.between?((@x - 1), (@x + 1)) && zombie.y.between?((@y - 1), (@y + 1))
        puts "The dog has killed #{zombie.name}!!!!"
        zombies.delete(zombie)
      end
    end
  end
end




