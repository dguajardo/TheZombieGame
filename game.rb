require_relative 'Dog.rb'
# ==> true

require_relative 'Zombie.rb'
# ==> true

require_relative 'Person.rb'
# ==> true

require_relative 'Gun.rb'
# ==> true


persons = []
# ==> []

zombies = []
# ==> []

dogs = []
# ==> []

guns = []
# ==> []


  10.times do |n|
    persons << Person.new("Persona #{n}")
  end
# ==> 10


  5.times do |n|
    zombies << Zombie.new("Zombie #{n}")
  end
# ==> 5

  
  2.times do  |x|
    dogs << Dog.new("Tales #{x}")
  end
# ==> 2


guns << Gun.new("Shotgun",3,4)
# ==> [#<Gun:0x000000011577b8 @name="Shotgun", @x=3, @y=4>]

guns << Gun.new("Knife",6,6)
# ==> [#<Gun:0x000000011577b8 @name="Shotgun", @x=3, @y=4>, #<Gun:0x00000001146418 @name="Knife", @x=6, @y=6>]

guns << Gun.new("Baseball bate",3,8)
# ==> [#<Gun:0x000000011577b8 @name="Shotgun", @x=3, @y=4>, #<Gun:0x00000001146418 @name="Knife", @x=6, @y=6>, #<Gun:0x0000000112e3b8 @name="Baseball bate", @x=3, @y=8>]


puts persons.count
# =10
# ==> nil

puts zombies.count
# =5
# ==> nil

puts dogs.count
# =2
# ==> nil

puts guns.count
# =3
# ==> nil

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
      zombies = z.kill zombies
    end
  end
end
# =Hey Persona 0, everything is all right around here
# =Hey Persona 0, everything is all right around here
# =Hey Persona 0, everything is all right around here
# =Danger, danger Persona 0 the zombie Zombie 3 is closer!!! Brainnnssss!!!!
# =Hey Persona 0, everything is all right around here
# =NoMethodError: undefined method `zombies' for #<Dog:0x0000000116a778 @name="Tales 0", @x=7, @y=2>
# = from (irb):63:in `block (2 levels) in irb_binding'
# = from (irb):62:in `each'
# = from (irb):62:in `block in irb_binding'
# = from (irb):54:in `each'
# = from (irb):54
# = from /home/diego/.rvm/rubies/ruby-2.2.3/bin/irb:11:in `<main>'



puts "The number of survivors is #{persons.count}"

puts "The number of zombies  is #{zombies.count}"

puts "The number of dogs is  #{dogs.count}"

puts "armas  que quedaron tiradas #{guns.count}"

