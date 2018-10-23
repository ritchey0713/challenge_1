require_relative '../root_CLI.rb'

describe "./lib/main3.rb" do
  describe '#parse_file' do
    it 'returns an array of strings' do
      file = "seed_data.txt"
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
      expect(get_driver_names(driver)).to eq("Dan")
    end
  end


















end
