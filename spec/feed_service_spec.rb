require 'spec_helper'

describe 'FeedNasaService' do

  context 'Retrieve a list of Asteroids based on their closest approach date to Earth' do

    before(:all) do
      @feed_service = NasaServiceio.new.feed_nasa_service
      @feed_service.feed_nasa_data('2018-04-10', '2018-04-11')
    end

    it 'should return the neo_reference_id number ' do
      expect(@feed_service.get_neo_reference_id).to eq "2204131"
    end

  end

end
