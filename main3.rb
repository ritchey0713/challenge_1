<<<<<<< HEAD
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
      assign_trips(hash, driver, new_line)
    end
  end
    average_trips(hash)
end

  def get_drivers(driver)
    driver  = driver.split(" ")[1..-1].join(" ")
    return driver
  end

  def get_trips(trip)
    trip = trip.split(" ")
    trip_distance = trip[4].to_f.floor
    trip_duration = ((Time.parse(trip[3]) - Time.parse(trip[2])) / 3600).round(1)
    average_speed = (trip_distance / trip_duration).floor
    return {distance: trip_distance, time: trip_duration}
  end

  def assign_trips(hash, driver, new_line)
    if hash.keys.include?(driver)
      hash[driver] << get_trips(new_line)
    end
  end

  def average_trips(hash)
    hash.map do |driver|
      driver[1].inject do |a, b|
        result = {}
        result[:distance] = a[:distance] + b[:distance]
        result[:time] = a[:time] + b[:time]
        result[:speed] = (result[:distance] / result[:time])
        driver[1] = []
        hash[driver[0]] = result
      end
    end
  end

  extract_data("seed_data.txt")
=======
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
  hash.each do |driver|
    if !driver[1].empty?
    driver = driver.flatten
    puts "#{driver[0]}: #{driver[1][:distance].round} miles @ #{driver[1][:speed].round} mph"
  else
    puts "#{driver[0]}: 0 miles"
  end
end
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
    sort_drivers(hash)
    print_trips(hash)
end

extract_data("seed_data.txt")
>>>>>>> 2f1c5e18bb0ddeb872e5095c3a61c189328d4a5f
