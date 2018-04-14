require 'httparty'
require 'json'

class BrowseNasaService
  include HTTParty

  base_uri 'https://api.nasa.gov'

def initialize
  @api_key = 'xSueer8U7aEtmgluw9uQ6TwzBj0qegX5s662WJ6y'
end

  def browse_nasa_data(demo_key)
    @get_nasa_browse_data = JSON.parse(self.class.get("/neo/rest/v1/neo/browse?api_key=#{demo_key}").body)
  end

  def print_results
    puts JSON.pretty_generate(@get_nasa_browse_data).gsub(":", "=>")
  end

  def get_reference_id_from_body_response
    @get_nasa_browse_data['near_earth_objects'][0]['neo_reference_id']
  end

  def results_hash
   @get_nasa_browse_data.class
  end

  def result_float
    @get_nasa_browse_data['near_earth_objects'][0]['close_approach_data'][0]['orbiting_body']
  end

  def result_boolean
    @get_nasa_browse_data['near_earth_objects'][0]['is_potentially_hazardous_asteroid']
  end

  def result_date_structure
    @get_nasa_browse_data['near_earth_objects'][0]['close_approach_data'][0]['close_approach_date']
  end

  def result_hash_should_have_this_key
    @get_nasa_browse_data['near_earth_objects'][0]['miles']
  end

end

# browse = BrowseNasaService.new
#
# browse.browse_nasa_data('2018-04-09', '2018-04-10')
#
# browse.print_results
