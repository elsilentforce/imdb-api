class SearchCacheReader < ApplicationService
  # Read the cache for previous Searches of a given term
  
  def initialize(term)
    @term = term
  end

  def call
    Rails.cache.read(@term)
  end
end
