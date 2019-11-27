class Parking
  attr_accessor :dimension_breadth, :dimension_length , :array_parking_spots
  @@number_of_bikes_parked=0
  @@number_of_cars_parked=0
  def initialize(dimension_length,dimension_breadth)
    @dimension_length=dimension_length
    @dimension_breadth=dimension_breadth
    @array_parking_spots=Array.new(@dimension_length){Array.new(@dimension_breadth)}
    @vehicle_type=" "
  end
  #def ask_dimesion
   # puts "ENTER THE DIMENSION:(LENGTH and BREADTH)"
   # @dimension_length=gets.chomp
   # @dimension_breadth=gets.chomp
 # end
  def give_vehicle_type
    puts "ENTER THE VEHICLE TYPE(CAR,BIKE,TRUCK)"
    @vehicle_type=gets.chomp.downcase

    if @vehicle_type == "bike"
      puts "ENTER THE PARKING SPOT NUMBER YOU WANT"
      puts "Enter the row you want"
      parking_bike_row=gets.chomp
      puts "Enter the column you want"
      parking_bike_column=gets.chomp
      unless array_parking_spots[parking_bike_row][parking_bike_column].empty?
        @@number_of_bike_parked+=1
        puts "Done"
      else
        puts "Sorry! the space is full. Please try again."
      end
    end
    if @vehicle_type == "car"
      puts "ENTER THE PARKING SPOT NUMBER YOU WANT"
      puts "Enter the row you want"
      parking_car_row=gets.chomp
      puts "Enter the column you want"
      parking_car_column=gets.chomp

      unless array_parking_spots[parking_car_row][parking_car_column].empty?
        @@number_of_car_parked+=1
        puts "Done"
      else
      puts "Sorry! the space is full. Please try again."
      end
    end

  end

end

parking= Parking.new(20,30)
parking.give_vehicle_type