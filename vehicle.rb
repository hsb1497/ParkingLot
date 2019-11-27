class Vehicle

  def vehicle_type
    puts "Enter your vehicle type(bike,car,truck)"
    vehicle=gets.chomp.downcase
    return vehicle
  end

end