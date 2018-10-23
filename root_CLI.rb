require 'pry'
require 'time'

def parse_file(file)
  fileName = file.to_s
  lines = File.readlines(fileName)
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

def assign_trips_to_driver(hash, driver, trip)
   hash.keys.include?(driver) ? hash[driver] << build_trips(trip) : nil
end

def map_average_trips_for_drivers(hash)
  hash.map { |driver|
    driver[1].inject {|a, b|
      result = {}
      result[:distance] = a[:distance] + b[:distance]
      result[:time] = a[:time] + b[:time]
      result[:speed] = (result[:distance] / result[:time])
      hash[driver[0]] = [result]
    }
  }
end

def output_data(hash)
  array_drivers = []
  hash.each do |driver|
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

def extract_data_from_file(file)
  hash = {}
  parse_file(file).map { |line|
    if line.include?("Driver")
      hash[get_driver_names(line)] = []
    elsif line.include?("Trip")
      arr = line.split(" ")
      driver = arr[1]
      assign_trips_to_driver(hash, driver, line)
    end
  }
    map_average_trips_for_drivers(hash)
    output_data(hash)
    binding.pry
end

