require 'httparty'
require 'json'

class LookupNasaService
  include HTTParty

  base_uri 'https://api.nasa.gov'

  def initialize
    @api_key = 'xSueer8U7aEtmgluw9uQ6TwzBj0qegX5s662WJ6y'
  end

  def lookup_nasa_data
    @get_nasa_lookup_data = JSON.parse(self.class.get("/neo/rest/v1/neo/3542519?api_key=#{@api_key}").body)
  end

  def first_lookup_test
    @get_nasa_lookup_data['neo_reference_id']
  end

  def get_hash_data_results
    @get_nasa_lookup_data['is_potentially_hazardous_asteroid']
  end

  def get_name_of_orbiting_planet
    @get_nasa_lookup_data['close_approach_data'][0]['orbiting_body']
  end

  def get_float_number_return
    @get_nasa_lookup_data['close_approach_data'][0]['relative_velocity']['kilometers_per_second'].to_f
  end

end

# hash = LookupNasaService.new
# hash.lookup_nasa_data
#
# hash.print_results
