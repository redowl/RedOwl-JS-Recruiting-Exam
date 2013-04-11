_ = require 'underscore'

class MovieRatingsResource

  constructor: (movieRatings) ->
    @_movieRatings = movieRatings ? {}
    for movie, ratings of @_movieRatings
      @_movieRatings[movie] = _.shuffle ratings

  getAllMovieRatings: -> @_movieRatings

  getMovieRatings: (movie) -> @_movieRatings[movie] ? (throw new Error 'Movie does not exist in repository')

  putMovieRatings: (movie, ratings) -> @_movieRatings[movie] = _.shuffle ratings

  postMovieRating: (movie, rating)->
    (@_movieRatings[movie] ?= []).push rating
    @_movieRatings[movie] = _.shuffle @_movieRatings[movie]

  deleteMovieRatings: (movie) ->
    if @_movieRatings[movie]? then delete @_movieRatings[movie] else throw new Error 'Movie does not exist in repository'

module.exports = MovieRatingsResource