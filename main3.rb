require 'pry'
require 'time'

def parse_file(file)
  fileName = file.to_s
  lines = File.readlines(fileName)
  lines = lines.join.split("\n")
end

def get_drivers(driver)
  driver  = driver.split(" ")[1..-1].join(" ")
  return driver
end

  def get_trips(trip)
    trip = trip.split(" ")
    trip_distance = trip[4].to_f
    trip_duration = ((Time.parse(trip[3]) - Time.parse(trip[2])) / 3600)
    average_speed = (trip_distance / trip_duration)
    return {distance: trip_distance, time: trip_duration, speed: average_speed}
  end

def assign_trips(hash, driver, new_line)
   hash.keys.include?(driver) ? hash[driver] << get_trips(new_line) : nil
end

def average_trips(hash)
  hash.map { |driver|
    driver[1].inject {|a, b|
      result = {}
      result[:distance] = a[:distance] + b[:distance]
      result[:time] = a[:time] + b[:time]
      result[:speed] = (result[:distance] / result[:time])
      hash[driver[0]] = [result] }
  }
  
end

def sort_drivers(hash)

end 

def print_trips(hash)
  array_drivers = []
  hash.each do |driver|
   if !driver[1].empty?
      driver = driver.flatten
      array_drivers << "#{driver[0]}: #{driver[1][:distance].round} miles @ #{driver[1] [:speed].round} mph"
    else
      puts "#{driver[0]}: 0 miles"
  end
end
  x = array_drivers.sort do |a, b|
    b[/\d+/].to_i <=> a[/\d+/].to_i
  end
  binding.pry
end

def extract_data(file)
  hash = {}
  parse_file(file).map { |new_line|
    if new_line.include?("Driver")
      hash[get_drivers(new_line)] = []
    elsif new_line.include?("Trip")
      arr = new_line.split(" ")
      driver = arr[1]
      assign_trips(hash, driver, new_line)
    end
  }
    average_trips(hash)
    print_trips(hash)
end

extract_data("seed_data.txt")

