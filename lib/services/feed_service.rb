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

  def get_neo_reference_id_to_match
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['neo_reference_id']
  end

  def get_hash_of_overall_data_result
   @get_nasa_feed_data.class
  end

  def get_nasa_jpl_url_check_structure_to_regular_expression
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['nasa_jpl_url']
  end

  def get_name_of_orbiting_body_string
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['close_approach_data'][0]['orbiting_body']
  end

  def get_potentially_hazardous_asteroid_result_boolean
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['is_potentially_hazardous_asteroid']
  end

  def get_feed_close_approach_date__check_structure_regular_expression
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['close_approach_data'][0]['close_approach_date']
  end

  def get_hash_key_to_match_right_key
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['estimated_diameter']['feet']
  end

  def get_miss_distance_astronomical_length_integer
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['close_approach_data'][0]['miss_distance']['astronomical'].to_f
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['close_approach_data'][0]['miss_distance']['astronomical'].length
  end

  def get_miss_distance_astronomical_length_string
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['close_approach_data'][0]['miss_distance']['astronomical']
  end

  def get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_min_float
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['estimated_diameter']['kilometers']['estimated_diameter_min']
  end

  def get_estimated_diameter_of_asteroid_in_kilometers_estimated_diameter_max_float
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['estimated_diameter']['kilometers']['estimated_diameter_max']
  end

  def get_estimated_diameter_of_asteroid_in_meters_estimated_diameter_min_float
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['estimated_diameter']['meters']['estimated_diameter_min']
  end

  def get_estimated_diameter_of_asteroid_in_meters_estimated_diameter_max_float
    @get_nasa_feed_data['near_earth_objects']['2018-04-10'][0]['estimated_diameter']['meters']['estimated_diameter_max']
  end

end
