class ParkingLot

  @@bikes_parked=0
  @@cars_parked=0
  @@trucks_parked=0
  @@slots_filled=0
  @@row=0
  @@column=0
  @@array=Array.new


  #attr_accessor :row,:column,:array

  #def initialize(row,columns,array)

  #  @row=row
  #  @column=columns
  #  @array=array

 # end
  def array
    @@array
  end

  def self.dimension
    puts "Enter the row value"
    @@row=gets.chomp.to_i
    puts "Enter the column value"
    @@column=gets.chomp.to_i
    @@array=Array.new(@@row){Array.new(@@column)}
  end

  def vehicles_parked
    puts "No of BIKES PARKED:#{@@bikes_parked}\n"+
        "NO OF CARS PARKED:#{@@cars_parked}\n"+
        "NO OF TRUCKS PARKED:#{@@trucks_parked}"
  end

  def parking_space_for_bike(vehicle_number)

    puts "Enter 1 number"
    number_1=gets.chomp.to_i

    row_number_1=(number_1-1)/@@column
    column_number_1=(number_1-1)%@@column

    if array[row_number_1][column_number_1].nil?
      array[row_number_1][column_number_1]=vehicle_number + "b"
      @@bikes_parked+=1
      @@slots_filled+=1
      puts "Bike is parked at location [#{row_number_1},#{column_number_1}] DONE\n"
      display
      puts "\n"
      vehicles_parked
      #puts "\nNO OF BIKES PARKED #{@@bikes_parked}"
    else
      puts "Sorry bike cannot be parked at this location"
    end

  end

  def parking_space_for_car(vehicle_number)

    car_is_parked=false

    until car_is_parked==true do

      puts "Enter 2 numbers where you want to park car in the matrix"
      number_1 = gets.chomp.to_i
      number_2 = gets.chomp.to_i
      row_number1 = (number_1 - 1) / @@column
      column_number1 = (number_1 - 1) % @@column
      row_number_2 = (number_2 - 1) / @@column
      column_number_2 = (number_2 - 1) % @@column

      if (array[row_number1][column_number1].nil?) && (array[row_number_2][column_number_2].nil?)
        array[row_number1][column_number1] = vehicle_number + "c"
        array[row_number_2][column_number_2] = vehicle_number + "c"
        @@cars_parked += 1
        @@slots_filled += 2
        puts "Car is parked at location #{row_number1},#{column_number1} & #{row_number_2},#{column_number_2} DONE\n"
        display
        puts "\n"
        vehicles_parked
        #puts "NO OF CARS PARKED = #{@@cars_parked}"
        car_is_parked == true
        break

      else
        puts "Sorry car cannot be parked at this location as you have chosen a filled spot.Try Again"
        car_is_parked==false
      end

    end

  end

  def truck_parking_space(vehicle_number)

    i=0
    j=0
    (0..@@row - 1).each { |i|
      (0..@column-1).each { |j|

      }

    }
    if @@array[i][j]
      
    end
    truck_is_parked=false

    until truck_is_parked==true do

      puts "Enter 4 numbers that are to be used for parking location of truck"
      number_1=gets.chomp.to_i
      number_2=gets.chomp.to_i
      number_3=gets.chomp.to_i
      number_4=gets.chomp.to_i

      row_number_1=(number_1-1)/@@column
      col_number_1=(number_1-1)%@@column
      row_number_2=(number_2-1)/@@column
      col_number_2=(number_2-1)%@@column
      row_number_3=(number_3-1)/@@column
      col_number_3=(number_3-1)%@@column
      row_number_4=(number_4-1)/@@column
      col_number_4=(number_4-1)%@@column

      if (array[row_number_1][col_number_1].nil? && array[row_number_2][col_number_2].nil? && array[row_number_3][col_number_3].nil? && array[row_number_4][col_number_4].nil?)
        array[row_number_1][col_number_1]=vehicle_number+"t"
        array[row_number_2][col_number_2]=vehicle_number+"t"
        array[row_number_3][col_number_3]=vehicle_number+"t"
        array[row_number_4][col_number_4]=vehicle_number+"t"

        @@trucks_parked+=1
        @@slots_filled+=4

        puts "Truck is parked at location #{row_number_1},#{col_number_1} #{row_number_2},#{col_number_2}
             #{row_number_3},#{col_number_3} #{row_number_4},#{col_number_4} DONE\n"

        display
        puts "\n"
        vehicles_parked
        truck_is_parked==true
        break
        #puts "NO OF TRUCKS PARKED #{@@trucks_parked}"

      else
        puts "Sorry Truck cannot be parked at this location as the location is already filled.Try Again"
        truck_is_parked==false
      end
    end

  end

  def display
    i=0
    j=0
    (0..@@row-1).each { |i|
      (0..@@column-1).each { |j|
        if @@array[i][j].nil?
          print"\t\tnil"
        else
          print "\t\t#{@@array[i][j]}  "
        end

      }
      print "\n"
    }
  end
  
 end








