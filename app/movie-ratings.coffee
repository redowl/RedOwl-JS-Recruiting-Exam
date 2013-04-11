class MovieRatingsResource

  constructor: (ratings) -> @_movieRatings = ratings ? {}

  getAllMovieRatings: -> @_movieRatings

  getMovieRatings: (movie) -> @_movieRatings[movie] ? (throw new Error 'Movie does not exist in repository')

  putMovieRatings: (movie, ratings) -> @_movieRatings[movie] = ratings

  postMovieRating: (movie, rating)->
    (@_movieRatings[movie] ?= []).push rating
    @_movieRatings[movie]

  deleteMovieRatings: (movie) ->
    if @_movieRatings[movie]? then delete @_movieRatings[movie] else throw new Error 'Movie does not exist in repository'

module.exports = MovieRatingsResource