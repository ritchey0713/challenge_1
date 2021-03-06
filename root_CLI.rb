require 'time'
require 'pry'
def parse_file(file)
  fileName = file.to_s
  lines = File.readlines(fileName)
  binding.pry
  lines = lines.join.split("\n")
end

def get_driver_names(driver)
  driver  = driver.split(" ")[1..-1].join(" ")
  return driver
end

def build_trips(trip)
  trip = trip.split(" ")
  trip_distance = trip[4].to_f
  trip_duration = ((Time.parse(trip[3]) - Time.parse(trip[2])) / 3600)
  average_speed = (trip_distance / trip_duration)
  return {distance: trip_distance, time: trip_duration, speed: average_speed}
end

def assign_trips_to_driver(driver_hash, driver, trip)
   driver_hash.keys.include?(driver) ? driver_hash[driver] << build_trips(trip) : nil
end

def map_average_trips_for_drivers(driver_hash)
  driver_hash.map { |driver|
    driver[1].inject {|a, b|
      result = {}
      result[:distance] = a[:distance] + b[:distance]
      result[:time] = a[:time] + b[:time]
      result[:speed] = (result[:distance] / result[:time])
      driver_hash[driver[0]] = [result]
    }
  }
end

def output_data(driver_hash)
  array_drivers = []
  driver_hash.each do |driver|
   if !driver[1].empty?
      driver = driver.flatten
      array_drivers << "#{driver[0]}: #{driver[1][:distance].round} miles @ #{driver[1] [:speed].round} mph"
   else
      array_drivers << "#{driver[0]}: 0 miles"
  end
end
  sort_drivers_by_distance(array_drivers).each { |driver|
    puts "#{driver}"
  }
end

def sort_drivers_by_distance(array_drivers)
  sorted_trips = array_drivers.sort { |a, b|
    b[/\d+/].to_i <=> a[/\d+/].to_i }
end

def parse_line(driver_hash, line)
  if line.include?("Driver")
    driver_hash[get_driver_names(line)] = []
  elsif line.include?("Trip")
    line_array = line.split(" ")
    driver = line_array[1]
    assign_trips_to_driver(driver_hash, driver, line)
  end
end 

def extract_data_from_file(file)
  driver_hash = {}
  parse_file(file).map { |line|
    parse_line(driver_hash, line)
  }
  map_average_trips_for_drivers(driver_hash)
  output_data(driver_hash)
end


