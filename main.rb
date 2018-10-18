require 'pry'
require 'time'
# take a .txt file, parse it for info
#two commands given, Driver, and Trip
#Driver registers a new driver
#Trip records a new trip, trips under 5 mph/ over 100 mph arent included
#trip has a name, start time, end time, and miles driven
# example file
# Driver Dan
# Driver Alex
# Driver Bob
# Trip Dan 07:15 07:45 17.3
# Trip Dan 06:12 06:32 21.8
# Trip Alex 12:01 13:16 42.0

#expected output
# Alex: 42 miles @ 34 mph
# Dan: 39 miles @ 47 mph
# Bob: 0 miles

# ["Driver Dan\n",
#  "Driver Alex\n",
#  "Driver Bob\n",
#  "Trip Dan 07:15 07:45 17.3\n",
#  "Trip Dan 06:12 06:32 21.8\n",
#  "Trip Alex 12:01 13:16 42.0\n"]

# => ["Trip", "Dan", "07:15", "07:45", "17.3"]
# trip[2] = start_time
#trip[3] = end time
#trip[4] = speed

def parse_file(file)
  fileName = file.to_s
  lines = File.readlines(fileName)
  lines = lines.join.split("\n")
end

def get_drivers(file)
  parse_file(file).map do |new_line|
    if new_line.include?("Driver")
      print_drivers(new_line)
    end
  end
end

def print_drivers(driver)
  miles_driven = 0
  driver.split(" ")[1..-1].join(" ")
  return "#{driver}: #{miles_driven} miles"
end

def get_trips(file)
  parse_file(file).map do |new_line|
    if new_line.include?("Trip")
      set_trips(new_line)
    end
  end
end


def set_trips(trip)
  trip = trip.split(" ")
  trip_driver = trip[1]
  trip_distance = trip[4].to_i
  trip_duration = ((Time.parse(trip[3]) - Time.parse(trip[2])) / 3600)
  average_speed = (trip_distance / trip_duration).round
  create_trip(trip_driver, trip_distance, trip_duration, average_speed)
end

def create_trip(trip_driver, trip_distance, trip_duration, average_speed)
  if print_drivers(trip_driver).include?(trip_driver)
    #binding.pry
  puts "#{trip_driver}: #{trip_distance} miles @ #{average_speed} mph"
end
end


get_drivers("seed_data.txt")
get_trips("seed_data.txt")
