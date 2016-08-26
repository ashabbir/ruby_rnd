class Car
  attr_accessor :color, :doors

  def initialize
    yield(self)
  end
end

car = Car.new do |c|
  c.color = 'Red'
  c.doors = 4
end

puts "Color: #{car.color} & #{car.doors} doors"
