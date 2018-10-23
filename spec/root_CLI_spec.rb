require_relative '../root_CLI.rb'

describe "./lib/main3.rb" do
  describe '#parse_file' do
    it 'returns an array of strings' do
      file = "seed_data.txt"
      expect(file).to be_a(String)
      expect(parse_file(file)).to eq(["Driver Dan",
        "Driver Alex",
        "Driver Bob",
        "Trip Dan 07:15 07:45 17.3",
        "Trip Dan 06:12 06:32 21.8",
        "Trip Alex 12:01 13:16 42.0"])
      end
  end

  describe '#get_driver_names' do
    it 'takes one string as an argument and returns as a name' do
      driver = 'Driver Dan'
      expect(driver).to be_a(String)
      expect(get_driver_names(driver)).to eq("Dan")
    end
  end
  
  describe '#build_trips' do 
    it 'takes a trip as an argument and returns a hash with, distance, time and speed' do
    trip = "Trip Dan 07:15 07:45 17.3"
    expect(trip).to be_a(String)
    expect(trip).to eq("Trip Dan 07:15 07:45 17.3")
    expect(build_trips(trip)).to eq({:distance=>17.3, :time=>0.5, :speed=>34.6})
  end
end 

describe '#assign_trips_to_driver' do 
  it 'takes three arguments, a hash, a driver, and a trip' do
    hash = {"Dan"=>[], "Alex"=>[], "Bob"=>[]}
    driver = "Dan"
    trip = "Trip Dan 07:15 07:45 17.3"
    expect(hash).to be_a(Hash)
    expect(hash).to eq({"Dan"=>[], "Alex"=>[], "Bob"=>[]})
    expect(driver).to be_a(String)
    expect(driver).to eq("Dan")
    expect(trip).to be_a(String)
    expect(trip).to eq("Trip Dan 07:15 07:45 17.3")
    expect(assign_trips_to_driver(hash, driver, trip)).to eq([{:distance=>17.3, :time=>0.5, :speed=>34.6}])
  end
end

describe '#map_average_trips_for_drivers' do 
  it 'takes a hash as an arguemnt' do
    hash = {"Dan"=>[{:distance=>17.3, :time=>0.5, :speed=>34.6}, {:distance=>21.8, :time=>0.3333333333333333, :speed=>65.4}],
    "Alex"=>[{:distance=>42.0, :time=>1.25, :speed=>33.6}],
    "Bob"=>[]}
    expect(map_average_trips_for_drivers(hash)).to eq( [[{:distance=>39.1, :time=>0.8333333333333333, :speed=>46.92000000000001}], {:distance=>42.0, :time=>1.25, :speed=>33.6}, nil] )
  end
end

describe '#output_data' do 
  it 'takes a hash as an arguemnt' do
    hash = {"Dan"=>[{:distance=>39.1, :time=>0.8333333333333333, :speed=>46.92000000000001}], "Alex"=>[{:distance=>42.0, :time=>1.25, :speed=>33.6}], "Bob"=>[]}
    expect(output_data(hash)).to eq(["Alex: 42 miles @ 34 mph", "Dan: 39 miles @ 47 mph", "Bob: 0 miles"])
  end
end

describe '#sort_drivers_by_distance' do 
  it 'takes an array of drivers' do
    array = ["Dan: 39 miles @ 47 mph", "Alex: 42 miles @ 34 mph", "Bob: 0 miles"]
    element = "Alex: 42 miles @ 34 mph"
    expect(sort_drivers_by_distance(array)).to eq(["Alex: 42 miles @ 34 mph", "Dan: 39 miles @ 47 mph", "Bob: 0 miles"])
    expect(sort_drivers_by_distance(array).first).to eq(element)
  end
end

end























