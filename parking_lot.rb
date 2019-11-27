class ParkingLot
  @@bikes_parked=0

  attr_accessor :breadth,:length,:array,:vehicle, :row_parking, :column_parking, :car_row_parking,:car_column_parking

  def initialize(length,breadth)
    @length=length
    @breadth=breadth
    @array=Array.new(@length){Array.new(@breadth)}
    @vehicle=""
    @row_parking=0
    @column_parking=0
    @car_row_parking=0
    @car_column_parking=0
  end
  
  def vehicle_type
    puts "Enter your type of vehicle(BIKE,CAR,TRUCK)"
    @vehicle=gets.chomp.downcase
    parking_space()
  end

  def parking_space
    if @vehicle == "bike"
      parking_space_for_bike()
    elsif @vehicle == "car"
      parking_space_for_car()
    else
      parking_space_for_truck()
    end
  end

  def parking_space_for_bike
    puts "Enter the row"
    row_parking=gets.chomp.to_i
    puts "Enter the column"
    column_parking=gets.chomp.to_i
    if array[car_row_parking][car_column_parking].nil?
      array[row_parking][column_parking].push("bike")
      @@bikes_parked+=1
      puts @@bikes_parked
      puts "DONE"
    else
      puts "Sorry bike cannot be parked at this location"
    end
  end

  def parking_space_for_car
    puts "Enter the row"
    car_row_parking=gets.chomp
    puts "Enter the column"
    car_column_parking=gets.chomp
    check_car_space_available(car_row_parking,car_column_parking)
    #array[car_row_parking][car_column_parking].push("fill")
  end

  def check_car_space_available(car_row_parking, car_column_parking)
    if array[car_row_parking][car_column_parking].nil? && (array[car_row_parking][car_column_parking+1].nil? || array[car_row_parking][car_column_parking-1].nil? ||
    array[car_row_parking+1][car_column_parking].nil? || array[car_row_parking-1][car_column_parking].nil?)

      array[car_row_parking][car_column_parking].push("fill")
    else
      puts "Sorry NO SPACE AVAILABLE for car at this location"
    end
  end
end

parking = ParkingLot.new(3,3)
parking.vehicle_type
