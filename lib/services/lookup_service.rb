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

  def estimated_diameter_size_float_check
    @get_nasa_lookup_data['estimated_diameter']['kilometers']['estimated_diameter_min']
  end

  def get_hash_data_results
    @get_nasa_lookup_data['is_potentially_hazardous_asteroid']
  end

  def get_epoch_date_close_approach_float
    @get_nasa_lookup_data['close_approach_data'][0]['epoch_date_close_approach']
  end

  def get_miles_per_hour_string
    @get_nasa_lookup_data['close_approach_data'][0]['relative_velocity']['miles_per_hour']
  end

  def get_miles_per_hour_character_length
    @get_nasa_lookup_data['close_approach_data'][0]['relative_velocity']['miles_per_hour'].to_f
    @get_nasa_lookup_data['close_approach_data'][0]['relative_velocity']['miles_per_hour'].length
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
