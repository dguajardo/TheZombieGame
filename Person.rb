class Person

  attr_accessor :name, :x, :y ,:arms #accesador y mutador para nombre y cordenadas de la persona

  def initialize(name = nil, posx = nil, posy = nil , arms = 0)  #iniciacion nula en caso de que no alla dato
    @name = name || 'John Doe'
    @x = posx || Random.rand(10)
    @y = posy || Random.rand(10)
    @arms = 0
  end

  def run!                       #funcion que permite correr a llas personas
    @x += Random.rand(-2..2)
    @y += Random.rand(-2..2)
  end

  def to_s                                            # to string muestra este mensaje al llamar
    "#{@name} esta en la posicion #{@x}, #{@y}"
  end

  def danger?(zombies)                                     # si el zombie esta cerca en un rango de 3 puts peligro

    begin
      fail StandardError, 'Zombie is empty' if zombies.empty?
    zombies.each do |zombie|
      if zombie.x.between?((@x - 3), (@x + 3)) && zombie.y.between?((@y - 3), (@y + 3))  #si zombie.x.y  esta entre 3 en el rango de persona
        puts "Danger, danger #{@name} el zombie #{zombie.name} esta cerca!!! #{zombie}"
      else
        puts "Hey #{@name}, todo esta tranquilo por aqui"
      end
    end
      rescue Exception => e 
        puts e.message
        puts e.backtrace # muestra la linea donde hay error 
    end     
  end

  def zombified?(zombies)                # puts a convertido en zombie en caso del rango sea 1 o menor
    zombies.each do |zombie|
      if zombie.x.between?((@x - 1), (@x + 1)) && zombie.y.between?((@y - 1), (@y + 1))
        puts "El nuevo zombie #{zombie.name} ha convertido a #{@name} en zombie!!!"
      end
    end
  end

  def addArms(armas)
    armas.each do |a|      
      if a.x == @x && a.y == @y 
        puts "------------------------------"
        puts " La #{@name}"
        puts  " ha recogido la #{a.name} "
        puts "-----------------------------"
        @arms = 1 
        tipo = armas.delete(a) 
      end
    end
  end

    def useArms(zombies)
      zombies.each do |z|
        if  @arms == 1 && z.x.between?((@x - 2), (@x + 2)) && z.y.between?((@y - 2), (@y + 2)) 
          puts "--------------------------"
          puts "#{@name} se a cargado a #{z.name}"
          puts "--------------------------"
          zombies.delete(z)
        end
      end
    end
end
