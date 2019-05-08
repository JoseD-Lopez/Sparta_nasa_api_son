require 'httparty'
require 'json'
require 'dotenv'

class BrowseNasaService
  include HTTParty

  Dotenv.load

  base_uri 'https://api.nasa.gov'

  def browse_nasa_data(demo_key)
    @get_nasa_browse_data = JSON.parse(self.class.get("/neo/rest/v1/neo/browse?api_key=#{ENV['API_KEY']}").body)
  end

  def get_reference_id_from_body_response
    @get_nasa_browse_data['near_earth_objects'][0]['neo_reference_id']
  end

  def get_overall_hash_result
   @get_nasa_browse_data.class
  end

  def get_orbiting_body_result_match_float
    @get_nasa_browse_data['near_earth_objects'][0]['close_approach_data'][0]['orbiting_body']
  end

  def get_potentially_hazardous_asteroid_result_boolean
    @get_nasa_browse_data['near_earth_objects'][0]['is_potentially_hazardous_asteroid']
  end

  def get_close_approach_date_structure_match_regular_expression
    @get_nasa_browse_data['near_earth_objects'][0]['close_approach_data'][0]['close_approach_date']
  end

  def get_hash_first_key_should_match
    @get_nasa_browse_data['page']
  end

  def get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_min_float
    @get_nasa_browse_data['near_earth_objects'][0]['estimated_diameter']['kilometers']['estimated_diameter_min']
  end

  def get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_max_float
    @get_nasa_browse_data['near_earth_objects'][0]['estimated_diameter']['kilometers']['estimated_diameter_max']
  end

end

# browse = BrowseNasaService.new
#
# browse.browse_nasa_data('2018-04-09', '2018-04-10')
#
# browse.print_results
