require_relative 'Dog.rb'

require_relative 'Zombie.rb'

require_relative 'Person.rb'

require_relative 'Gun.rb'


persons = []

zombies = []

dogs = []

guns = []


  10.times do |n|
    persons << Person.new("Persona #{n}")
  end


  5.times do |n|
    zombies << Zombie.new("Zombie #{n}")
  end

  
  2.times do  |x|
    dogs << Dog.new("Tales #{x}")
  end


guns << Gun.new("Shotgun",3,4)

guns << Gun.new("Knife",6,6)

guns << Gun.new("Baseball bate",3,8)


puts persons.count

puts zombies.count

puts dogs.count

puts guns.count

while persons.count > 0 && zombies.count > 0
 
  zombies.each(&:walk)
  persons.each(&:run!)
  dogs.each(&:move)
  persons.each do |p|
    p.addArms guns
    p.danger? zombies
    p.useArms zombies
    if p.zombified? zombies
      muerto = persons.delete(p)
      zombies << Zombie.new("Zombie #{muerto.name}")
    end
    dogs.each do |z|
      zombies = z. zombies
    end
  end
end



puts "The number of survivors is #{personas.count}"

puts "-----------------------------------------------"

puts "The number of zombies  is #{zombies.count}"

puts "-----------------------------------------------"

puts "The number of dogs is  #{perros.count}"

puts "-----------------------------------------------"

puts "The number of guns on the floor #{armas.count}"

puts "-----------------------------------------------"

puts "-----------------------------------------------"

