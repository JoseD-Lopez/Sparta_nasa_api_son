require 'httparty'
require 'json'

class FeedNasaService
  include HTTParty

  base_uri 'https://api.nasa.gov/neo/rest/v1'

  def initialize
    @api_key = 'xSueer8U7aEtmgluw9uQ6TwzBj0qegX5s662WJ6y'
  end

  def feed_nasa_data(start_date, end_date)
    @get_nasa_feed_data = JSON.parse(self.class.get("/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{@api_key}").body)
  end

  # def print_results
  #   puts JSON.pretty_generate(@get_nasa_feed_data).gsub(":", "=>")
  # end

  def get_neo_reference_id
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['neo_reference_id']
  end

end
