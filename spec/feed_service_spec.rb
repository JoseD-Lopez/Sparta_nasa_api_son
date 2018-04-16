require 'spec_helper'

describe 'FeedNasaService' do

  context 'Retrieve a list of Asteroids based on their closest approach date to Earth' do

    before(:all) do
      @feed_service = NasaServiceio.new.feed_nasa_service
      @feed_service.feed_nasa_data('2018-04-10', '2018-04-11')
    end

    it 'should return the feed neo_reference_id number ' do
      expect(@feed_service.get_neo_reference_id_to_match).to eq "2204131"
    end

    it 'should return feed hash' do
      expect(@feed_service.get_hash_of_overall_data_result).to eq Hash
    end

    it 'should have a date and be structured' do
      expect(@feed_service.get_nasa_jpl_url_check_structure_to_regular_expression).to match /\A^((http[s]?|ftp):\/)?\/?([^:\/\s]+)((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(.*)?(#[\w\-]+)?$\z/
    end

    it 'should return a string' do
      expect(@feed_service.get_name_of_orbiting_body_string).to be_a_kind_of(String)
    end

    it 'should return a boolean' do
      expect(@feed_service.get_potentially_hazardous_asteroid_result_boolean).to be false
    end

    it 'should have a date and be structured' do
      expect(@feed_service.get_feed_close_approach_date__check_structure_regular_expression).to match /\A([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))\z/
    end

    it 'should have the key' do
      expect(@feed_service.get_hash_key_to_match_right_key).to include("estimated_diameter_min" => 956.1808197541)
    end

    it 'should return the miss distance astronomical length integer' do
      expect(@feed_service.get_miss_distance_astronomical_length_integer).to eq 12
    end

    it 'should return the miss distance astronomical string' do
      expect(@feed_service.get_miss_distance_astronomical_length_string).to be_a_kind_of(String)
    end

    it 'should get estimated diameter of asteroid in kilometers estimated diameter min float' do
      expect(@feed_service.get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_min_float).to be_a_kind_of(Float)
    end

    it 'should get estimated diameter of asteroid in kilometers estimated diameter max float' do
      expect(@feed_service.get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_min_float).to be_a_kind_of(Float)
    end

    it 'should get estimated diameter of asteroid in meters estimated diameter min float' do
      expect(@feed_service.get_estimated_diameter_of_asteroid_in_meters_estimated_diameter_min_float).to be_a_kind_of(Float)
    end

    it 'should get estimated diameter of asteroid in meters estimated diameter min float' do
      expect(@feed_service.get_estimated_diameter_of_asteroid_in_meters_estimated_diameter_min_float).to be_a_kind_of(Float)
    end

    it 'should get estimated diameter of asteroid in meters estimated diameter max float' do
      expect(@feed_service.get_estimated_diameter_of_asteroid_in_meters_estimated_diameter_max_float).to be_a_kind_of(Float)
    end

  end

end
