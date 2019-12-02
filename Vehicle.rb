require './ParkingLot.rb'

class Vehicle < ParkingLot

  attr_accessor :vehicle_type, :vehicle_number

  def initialize(vehicle_type,vehicle_number)
    #super(0,0,Array.new)
    @vehicle_type=vehicle_type
    @vehicle_number=vehicle_number

  end

  def slots_empty?(vehicle_type)

    case vehicle_type

    when "bike"

      return true if ((@@row * @@column)-@@slots_filled)>=Bike::SLOTS_REQUIRED

    when "car"

      puts "\nHow do you want to park car (HORIZONTAL/VERTICAL).Type 'h' or 'v'"
      answer=gets.chomp.downcase
      case answer
      when "h"
        return true if horizontal_car_parking
      when "v"
        return true if vertical_car_parking
      else
        return false
      end

    when "truck"
      return true if ((@@row * @@column)-@@slots_filled)>=Truck::SLOTS_REQUIRED
    end

  end


  def vehicle

    case @vehicle_type

    when "bike"
      puts "\nYour vehicle type is bike and it requires 1 slot"
      if slots_empty?("bike")
        parking_space_for_bike(vehicle_number)
      else
        puts "Sorry! Space not empty inside Parking Space for parking this vehicle"
      end

    when "car"
      puts "\nYour vehicle type is car and it requires 2 slots"
      if slots_empty?("car")
        parking_space_for_car(vehicle_number)
      else
        puts "Sorry ! Space not empty inside Parking Space for parking this vehicle"
      end

    when "truck"
      puts "\nYour vehicle type is truck and it requires 4 slots"
      if slots_empty?("truck")
        truck_parking_space(vehicle_number)
      else
        puts "Sorry! Space not empty inside Parking Space for parking this vehicle"
      end

    else
      puts "Wrong Choice !! The vehicle type cannot be parked in Parking Space"
    end

  end

  def horizontal_car_parking
    i=0
    j=0
    str=""
    if ((@@row * @@column)-@@slots_filled)>=Car::SLOTS_REQUIRED
      (0..@@row-1).each {|i|
        (0..@@column-2).each {|j|

          if @@array[i][j].nil? && @@array[i][j+1].nil?
            str+="[#{i} #{j}],[#{i} #{j+1}]  "
          end
        }
      }
    end
    puts "#{str}"
    return true if !str.empty?
  end

  def vertical_car_parking
    i=0
    j=0
    str=""
    if ((@@row * @@column)-@@slots_filled)>=Car::SLOTS_REQUIRED
      (0..@@column-1).each {|i|
        (0..@@row-2).each {|j|

          if @@array[j][i].nil? && @@array[j+1][i].nil?
            str+="[#{j} #{i}],[#{j+1} #{i}]  "
          end
        }
      }
    end
    puts "#{str}"
    return true if !str.empty?
  end

end


class Car < Vehicle

  SLOTS_REQUIRED=2

end

class Bike < Vehicle

  SLOTS_REQUIRED=1

end

class Truck < Vehicle

  SLOTS_REQUIRED=4

end

ParkingLot.dimension
vehicle1=Vehicle.new("bike","1012")
vehicle2=Vehicle.new("car","2840")
vehicle3=Vehicle.new("truck","1404")
vehicle1.vehicle
vehicle2.vehicle
vehicle3.vehicle


