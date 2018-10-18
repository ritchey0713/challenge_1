require 'pry'
require 'time'

def parse_file(file)
  fileName = file.to_s
  lines = File.readlines(fileName)
  lines = lines.join.split("\n")
end

def extract_data(file)
  hash = {}
  parse_file(file).map do |new_line|
    if new_line.include?("Driver")
      hash[get_drivers(new_line)] = []
    elsif new_line.include?("Trip")
      arr = new_line.split(" ")
      driver = arr[1]
      get_trips(new_line)
      binding.pry
    #   # Trip Dan 7;18 7:25 28
    #
    #   output << get_trips(new_line)
    #   output[trip_driver] << {}
    end
  end
  end

  def get_drivers(driver)
    driver  = driver.split(" ")[1..-1].join(" ")
    return driver
  end

  def get_trips(trip)
    trip = trip.split(" ")
    trip_driver = trip[1]
    trip_distance = trip[4].to_i
    trip_duration = ((Time.parse(trip[3]) - Time.parse(trip[2])) / 3600)
    average_speed = (trip_distance / trip_duration).round
    return "{trip_driver}: #{trip_distance} miles @ #{average_speed} mph."
  end

  extract_data("seed_data.txt")
