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
      if hash.keys.include?(driver)
        hash[driver] << get_trips(new_line)
      end
    end
  end
    hash.map do |driver|
        driver[1].reduce do |a, b|
          result = {}
          result[:distance] = a[:distance] + b[:distance]
          result[:time] = a[:time] + b[:time]
          binding.pry
        end
        binding.pry
    end
end

  def get_drivers(driver)
    driver  = driver.split(" ")[1..-1].join(" ")
    return driver
  end

  def get_trips(trip)
    trip = trip.split(" ")
    trip_distance = trip[4].to_f.floor
    trip_duration = ((Time.parse(trip[3]) - Time.parse(trip[2])) / 3600)
    average_speed = (trip_distance / trip_duration).floor
    return {distance: trip_distance, time: trip_duration}
  end

  def average_trips(hash)

  end

  extract_data("seed_data.txt")
