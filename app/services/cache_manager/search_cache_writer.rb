class SearchCacheWriter < ApplicationService
  # Writes Search cache based on given term and result

  def initialize(term:, result:)
    @term = term
    @result = result
  end

  def call
    Rails.cache.write(@term, @search)
  end
end
