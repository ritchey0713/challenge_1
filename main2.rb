require 'pry'
require 'time'

def parse_file(file)
  fileName = file.to_s
  lines = File.readlines(fileName)
  lines = lines.join.split("\n")
end

def extract_data(file)
  output = []
  parse_file(file).map do |new_line|
    if new_line.include?("Driver")
      output << get_drivers(new_line)
    elsif new_line.include?("Trip")
      output << get_trips(new_line)
    end

  end
  binding.pry
end

def get_drivers(driver)
  driver  = driver.split(" ")[1..-1].join(" ")
  return "#{driver}: 0 miles"
end

def get_trips(trip)
  trip = trip.split(" ")
  trip_driver = trip[1]
  trip_distance = trip[4].to_i
  trip_duration = ((Time.parse(trip[3]) - Time.parse(trip[2])) / 3600)
  average_speed = (trip_distance / trip_duration).round
  return "#{trip_driver}: #{trip_distance} @ #{average_speed} mph."
end

extract_data("seed_data.txt")
