class MovieCacheWriter < ApplicationService
  # Writes movie info into local cache

  def initialize(movie)
    @movie = movie
  end

  def call
    Rails.cache.write(@movie['imdbID'], @movie)
  end
end
