require 'spec_helper'

describe 'BrowseNasaService' do

  context 'Browse the overall Asteroid data-set' do


    before(:all) do
      @browse_service = NasaServiceio.new.browse_nasa_service
      @browse_service.browse_nasa_data('xSueer8U7aEtmgluw9uQ6TwzBj0qegX5s662WJ6y')
    end

    it 'should return the neo_reference_id number ' do
      expect(@browse_service.get_reference_id_from_body_response).to eq '2021277'
    end

    it 'should return a hash' do
      expect(@browse_service.results_hash).to eq Hash
    end

    it 'should return a string' do
      expect(@browse_service.result_float).to be_a_kind_of(String)
    end

    it 'should return a boolean' do
      expect(@browse_service.result_boolean).to be false
    end

    it 'should have a date and be structured' do
      expect(@browse_service.result_date_structure).to match /\A([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))\z/
    end

    it 'should have the key' do
      expect(@browse_service.result_hash_should_have_this_key).has_key?('miles')
    end

  end

end
