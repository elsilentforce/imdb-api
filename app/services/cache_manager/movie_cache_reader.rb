class MovieCacheReader < ApplicationService
  # Finds a movie info into local cache

  def initialize(imdb_id)
    @imdb_id = imdb_id
  end

  def call
    Rails.cache.read(@imdb_id)
  end
end
