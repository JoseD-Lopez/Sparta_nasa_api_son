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

 end

end
