require 'spec_helper'

describe 'BrowseNasaService' do

  context 'Browse the overall Asteroid data-set' do


    before(:all) do
      @browse_service = NasaServiceio.new.browse_nasa_service
      @browse_service.browse_nasa_data('xSueer8U7aEtmgluw9uQ6TwzBj0qegX5s662WJ6y')
    end

    it 'should return the browse neo_reference_id number ' do
      expect(@browse_service.get_reference_id_from_body_response).to eq '2021277'
    end

    it 'should return a hash' do
      expect(@browse_service.get_overall_hash_result).to eq Hash
    end

    it 'should return a string' do
      expect(@browse_service.get_orbiting_body_result_match_float).to be_a_kind_of(String)
    end

    it 'should return a boolean' do
      expect(@browse_service.get_potentially_hazardous_asteroid_result_boolean).to be false
    end

    it 'should have a date and be structured' do
      expect(@browse_service.get_close_approach_date_structure_match_regular_expression).to match /\A([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))\z/
    end

    it 'should have a hash with a key and value that match' do
      expect(@browse_service.get_hash_first_key_should_match).to include("size" => 20)
    end

    it 'should get estimated diameter of asteroid in kilometers estimated diameter min float' do
      expect(@browse_service.get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_min_float).to be_a_kind_of(Float)
    end

    it 'should get estimated diameter of asteroid in kilometers estimated diameter max float' do
      expect(@browse_service.get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_max_float).to be_a_kind_of(Float)
    end

  end

end
