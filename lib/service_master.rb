require_relative 'services/browse_service'
require_relative 'services/feed_service'
require_relative 'services/lookup_service'


class NasaServiceio

  def feed_nasa_service
    FeedNasaService.new
  end

  def browse_nasa_service
    BrowseNasaService.new
  end

  def lookup_nasa_service
    LookupNasaService.new
  end

end
