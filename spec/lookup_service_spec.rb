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

  it 'should return boolean result saying weather or not astroid is hazardous' do
   expect(@lookup_service.get_hash_data_results).to be true
  end

  it 'should return one of three names' do
    expect(@lookup_service.get_name_of_orbiting_planet).to match('Merc')
  end

  it 'should be a floating point number' do
    expect(@lookup_service.get_float_number_return).to be_a_kind_of(Float)
 end

end
end
