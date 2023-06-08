class MovieFinder < MovieService
  # Finds a movie by its IMDB identifier using Open Movie API
  # You can find Shrek by using 'tt0126029' as example
  
  def initialize(imdb_id)
    @url = "#{BASE_PATH}&i=#{imdb_id}"
    @note = Note.find_by(imdb_id: imdb_id)
    @cached_movie = MovieCacheReader.call(imdb_id)
  end
  
  def call
    @cached_movie || fetch_movie_from_api
  end
  
  private
  
  def fetch_movie_from_api
    response = begin
      RestClient::Request.execute(method: :get, url: @url)
    rescue
      DEFAULT_ERROR_RESPONSE
    end

    data = JSON.parse(response)
    MovieCacheWriter.call(data) if data['error'].nil?
    data
  end

end
