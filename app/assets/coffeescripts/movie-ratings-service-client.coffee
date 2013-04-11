define ['vendor/jquery'], ($) ->
  module = {}

  module.getAllMovieRatings = (callback) -> $.get '/api/movieratings', callback

  module.getMovieRating = (movie, callback) -> $.get '/api/ratemovie/' + movie, callback

  return module