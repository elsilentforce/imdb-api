class MovieSearcher < MovieService
  # Search movies by Title

  def initialize(title)
    @term = title
    @url = "#{BASE_PATH}&s=#{title}"
    @cached_search = SearchCacheReader.call(title)
  end

  def call
    @cached_search || search_from_api
  end

  private

  def search_from_api
    response = begin 
      RestClient::Request.execute(method: :get, url: @url)
    rescue
      DEFAULT_ERROR_RESPONSE
    end

    data = JSON.parse(response)
    SearchCacheWriter.call(term: @term, result: data) if data['error'].nil?
    data
  end
end
