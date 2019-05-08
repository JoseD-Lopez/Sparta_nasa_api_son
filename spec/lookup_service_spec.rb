require 'spec_helper'

describe 'LookupNasaService' do

context '' do

  before(:all) do
    @lookup_service = NasaServiceio.new.lookup_nasa_service
    @lookup_service.lookup_nasa_data
  end

  it 'should return the reference neo id' do
    expect(@lookup_service.first_lookup_test).to eq "3542519"
  end

  it 'should be a floating point number the estimated diameter size' do
    expect(@lookup_service.estimated_diameter_size_float_check).to be_a_kind_of(Float)
  end

  it 'should return boolean result saying weather or not astroid is hazardous' do
   expect(@lookup_service.get_hash_data_results).to be true
  end

  it 'should return epoch date close approach' do
    expect(@lookup_service.get_epoch_date_close_approach_float).to be_a_kind_of(Integer)
  end

  it 'should return the relative velocity in miles per hour' do
    expect(@lookup_service.get_miles_per_hour_string).to be_a_kind_of(String)
  end

  it 'should return the relative velocity in miles per hour length' do
    expect(@lookup_service.get_miles_per_hour_character_length).to eq 16
  end

  it 'should return the name of the obiting body' do
    expect(@lookup_service.get_name_of_orbiting_planet).to match('Merc')
  end

  it 'should if parse into the float the string should become a floating point number type' do
    expect(@lookup_service.get_float_number_return).to be_a_kind_of(Float)
 end

end
end
