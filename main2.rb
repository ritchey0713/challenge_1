require 'pry'
require 'time'

def parse_file(file)
  fileName = file.to_s
  lines = File.readlines(fileName)
  lines = lines.join.split("\n")
end

def extract_data(file)
  driver_name = []
  output = []
  parse_file(file).map do |new_line|
    if new_line.include?("Driver")
      driver_name << get_drivers(new_line)
    elsif new_line.include?("Trip")
      output << get_trips(new_line)
    end
  end

 # output = ["Dan: 17 @ 34 mph.",
 #"Dan: 21 @ 63 mph.",
 #"Alex: 42 @ 34 mph."]

#  driver_name=
# ["Dan: 0 miles",
#   "Alex: 0 miles",
#   "Bob: 0 miles"]
  alter_output(output, driver_name)
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
  return "#{trip_driver}: #{trip_distance} miles @ #{average_speed} mph."
end

def alter_output(array, driver_name)
  i = 0
new_name = driver_name.map do |name|
name = name.split(":")[0]
  array.select{|arr| arr.include?(name)}
end

  # if new_name[].length > 1
  #   return new_name[]
end

extract_data("seed_data.txt")
