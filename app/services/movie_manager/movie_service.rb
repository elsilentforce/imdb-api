class MovieService < ApplicationService
  # ? https://www.omdbapi.com/
  # TODO: ADD SECRET HERE
  API_KEY = '4da197f5'
  BASE_PATH = "http://www.omdbapi.com/?apikey=#{API_KEY}"
  DEFAULT_ERROR_RESPONSE = { error: 'Cannot parse the API response' }
end
