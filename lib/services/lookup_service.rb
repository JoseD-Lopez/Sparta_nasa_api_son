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

  def print_results
    puts JSON.pretty_generate(@get_nasa_lookup_data).gsub(":", "=>")
  end

  def first_lookup_test
    @get_nasa_lookup_data['neo_reference_id']
  end
end

# hash = LookupNasaService.new
# hash.lookup_nasa_data
#
# hash.print_results
