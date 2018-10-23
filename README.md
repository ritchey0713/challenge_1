

# Root Take-Home Challenge 
=======
# The Problem 
1. given a txt file we have to parse over the lines, and modify the data for a output. 
2. the file will start each line with a "command"
3. Driver will create a new driver
4. Trip will record a trip for the specific driver
5. out data as a report 
6. round miles and mph to nearest int 
7. sort drivers by miles driven, greatest to smallest 

## implementation 
1. Create a method called #parse_file to take the .txt file and create an array of the lines by using the #File.readlines 

2. create a method called #parse_line that checks if each line starts with command "Driver" or "Trip"

3. When command "Driver" is used, add the drivers name to the hash, and start them with an empty array to store the trips in.

4. when command "trip" is used, we pass the hash and line(trip) to another method

5. when we have a trip we run #assign_trips_to_driver, which will check to make sure we have a driver as a key, and then will push the trip into their array of trips.

6. creating #build_trips, when we have a good trip and driver, we have to modify the trip to get the correct data, by splitting the trip string into an array it becomes easy to calculate, the speed, and duration. to get duration we also have to require 'time'

7. we want build trips to return a hash with keys for distance, duration, and the speed

8. after iterating the txt file, and creating all the drivers, and assigning the trips, we can map over the sub arrays to get a total average using #map_average_trips_for_drivers which will use inject on each drivers subarray to return a single hash for the total values. 



## Usage

    Run the app by calling ./bin/top_games, after boot, it will pull up the top three games
    from pcgamer.com, after you can inquire a summary of each game by inputting the correct
    number, it will also bring you back to the main menu afterwards. You can type 'exit' to 
    quit the app. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

