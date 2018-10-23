

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
1. Create a method called #parse_file, to take the .txt file and create an array of the lines by using the #File.readlines and return our array of lines

2. create a method called #parse_line, that we give a empty hash, and each line to, and checks if each line starts with command "Driver" or "Trip" and will return our hash of drivers and trips

3. When command "Driver" is used, grab the line and pass it to a helper, to get just the name back, add the drivers name to the hash, and start them with an empty array to store the trips in.

4. #get_driver_name takes a line as a string as an arg, and will remove the command from the string and give us the name to use as a key. returning the new hash, with all the driver names as keys, and an empty array as a value

5. when command "trip" is used, we split the string into an array, grabbing the driver name, and we pass the hash driver and line(trip) to another method to assign it properly 

6. when we have a trip we run #assign_trips_to_driver, which will check to make sure we have a driver as a key, then modify the trip for the data we want, then push the trip into their array of trips. if the driver doesnt yet exist, we will give nil back. will return the hash with trips in subarrays for each driver who has trips

7. creating #build_trips, when we have a good trip and driver, we have to modify the trip to get the correct data, by splitting the trip string into an array it becomes easy to calculate, the speed, and duration. to get duration we also have to require 'time' 

8. we want build trips to return a hash with keys for distance, duration, and the speed

9. after iterating the txt file, and creating all the drivers, and assigning the trips, we can map over the sub arrays to get a total average using #map_average_trips_for_drivers which will use inject on each drivers subarray to return a single hash for the total values. by creating a new hash to store our results in, we can replace the old data, we only want one total trip for each driver to be returned

10. create #output_data now that we have the correct data for each driver we can break the hash back down into strings to output our report, by iterating once more we can get access to the subarray, and flatten out the array, and making sure it exists and call the data we need by accessing the keys, or else output our string for drivers with no trips will return the array of strings to output 

11. after putting our report strings into a array, using #sort_drivers_by_distance we can sort them as required, by the greatest to smallest distance travelled, by using sort, and grabbing each drivers distance and comparing. returning our array of strings in the correct order

12. #extract_data_from_file will be used as a container method, that will pass the parsed data down to other methods, and be responsible to print the report.



## Testing
  For testing Rspec was implemented.
  1. set up test to require cli file   
  2. testing #parse file   
    2a. run a test for the passed in argument for the data type  
    2b. check the return to match the expected array of strings  
  3. test #get_driver_names   
    3a. test argument for data type   
    3b. test method to return only the name as a string    
  4. test #build_trips   
    4a. test trip argument to be string, and equal the first trip    
    4b. test return hash of trip, and calculations   
  5. test #assign_trips_to_driver    
    5a. test data passed to be correct    
    5b. test the driver array for trip being added   
  6.  test #map_average_trips_for_drivers   
    6a. test for hash argument   
    6b. test hash to modify to array, with trips averaged  
    6c. make sure drivers with no trips equal nil   
  7. test #output_data   
    7a. test hash argument   
    7b. test array for length, i.e. drivers being pushed in   
  8. test # sort_drivers_by_distance   
    8a. test array for type   
    8b. test size of array   
    8c. test first element for correct first element   
    8d. test entire array for proper sorting   
  9.test #parse_line  
    9a. test arguments for type 
    9b. test driver for empty array value  
  10. test #extract_data_from_file  
    10a. test for file argument    
    10b. test to match correct array    




## Thoughts 

