# SELF
# self refers to the 'current object we're inside'.
# So, when we're messing around defining methods on Array, String, etc. instances,
# self refers to the instance.

# Practice 1
# Define a method on string instances, called shoutify.
# This method should return the string text in uppercase,
# with an extra exclamation mark on the end. In other words,
# "hello world".shoutify should return "HELLO WORLD!".

class String
  def shoutify
    self.upcase + "!"
  end
end

puts""
puts "Practice 1"
puts "hello world"
puts "hello world".shoutify
puts ""

# CREATING METHODS ON A CLASS
# Practice 2
# If the class given to class doesn't exist, it will be made on-the-fly.
# That means we can just start with the below

# Dog = Class.new  <-- and this is no longer needed

class Dog
  def bark
    return "Woof!"
  end

  def color=(color)
    @color = color
  end

  def observe
    return "You see a " + @color + " dog."
  end
end

puts "Practice 2"
fido = Dog.new
baxter = Dog.new
fido.color = "brown"
baxter.color = "white"
puts fido.observe
puts baxter.observe
puts ""

# Practice 3
# Look closer at the method give_me_a_name and call_me (below).
# We can call the parameter name whatever we want:
#    @my_name_is
#    @name_i_would_like_to_be_known_by
# so long as we reference that same parameter in the method procedure.
#
# Also....
# Using Ruby's syntactic sugar, we can replace the penultimate line with
# woman.name = "Yasmin".

class Person
  def give_a_name(name)
    @my_name_is = name
  end

  def call_me(nickname)
    @name_i_would_like_to_be_known_by = nickname
  end

  def introduce
    return "Hello, I'm " + @my_name_is
  end
end

puts "Practice 3"
woman = Person.new
puts woman.give_a_name("Yasmin")
puts woman.introduce
puts ""


#MUTATING OBJECT STATE
# Practice 4

class Robot
  def legs=(number_of_legs)
    @number_of_legs = number_of_legs
  end

  def add_leg
    @number_of_legs += 1
  end

  def walk
    return "I'm walking on my " + @number_of_legs.to_s + " legs!"
  end
end

puts "Practice 4"
robot = Robot.new
robot.legs = 4
puts robot.walk
robot.add_leg
puts robot.walk
robot.add_leg
puts robot.walk
puts ""
#
# INSTANCE VARIABLES
# By using multiple parameters with initialize,
# we can provide multiple pieces of information to an object at once:
# Practice 5

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def introduce
    "Hello, I'm " + @name + ", and I'm " + @age.to_s + " years old."
  end

  def get_older
    @age += 1
  end
end

puts "Practice 5"
peter = Person.new("Peter", 17)
puts peter.introduce
peter.get_older
puts peter.introduce
puts ""

# CREATING NEW CLASSES
# Using objects to be more declarative
# Practice 6: Airport
class Airport
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    if @hangar.length < 1
      return "Error: there are no planes to take off"
    end

    if @hangar.include?(plane)
      @hangar.delete(plane)
      return plane
    else
      return "Error: plane not in hangar"
    end
  end

  def hangar_report
    if @hangar.length == 1
      "There is 1 plane in the hangar: #{@hangar}"
    else
      "There are #{ @hangar.length } planes in the hangar: #{@hangar}"
    end
  end
end

puts "Practice 6"
heathrow = Airport.new
puts heathrow.hangar_report
heathrow.land("LF002")
heathrow.land("LOT199")
puts heathrow.hangar_report
heathrow.take_off("LF002")
puts heathrow.hangar_report
puts ""

# CREATING NEW CLASSES
# Practice 7: Plane
#

class Plane
  def initialize(aircraft_number, operational_date, capacity, last_check)
    @aircraft_number = aircraft_number
    @operational_date = operational_date
    @capacity = capacity
    @last_check = [last_check]
  end

  def plane_report
    "#{@aircraft_number}'s last check was on #{@last_check.last} and has had a total of #{@last_check.length} inspections since being operational on #{@operational_date}."
  end

  def last_check(last_check)
    @last_check = @last_check.push(last_check)
  end

  def total_inspections
    @total_inspections = @last_check.length
  end

  def capacity(capacity)
    @capacity = capacity
  end

end

puts "Practice 7"
Luftansa = Plane.new("LF001", "03/04/2020", 300, "30/03/2020")
puts Luftansa.plane_report
Luftansa.last_check("01/04/2020")
puts Luftansa.plane_report
Luftansa.last_check("02/04/2020")
puts Luftansa.plane_report
Luftansa.last_check("03/04/2020")
puts Luftansa.plane_report
Luftansa.plane_report
puts ""
