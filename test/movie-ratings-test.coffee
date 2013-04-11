assert = require 'assert'

MovieRatingsResource = require '../app/movie-ratings'

describe 'MovieRatingsResource', ->

  movieRatings = {}

  beforeEach ->
    movieRatings = new MovieRatingsResource
      'Bladerunner': [5, 1]
      'The Empire Strikes Back': [1, 1, 2, 3, 5]

  describe '#getAllMovieRatings()', ->

    it 'should return the correct ratings for all movies', ->
      throw new Error 'Not implemented'

  describe '#getMovieRatings()', ->

    it 'should return the correct movie ratings for the requested movie', ->
      throw new Error 'Not implemented'

    it 'should throw an error if the requested movie does not exist in the repo', ->
      throw new Error 'Not implemented'

  describe '#putMovieRatings()', ->

    it 'should put a new movie with ratings into the repo and return the ratings', ->
      throw new Error 'Not implemented'

    it 'should overwrite the ratings of an existing movie in the repo and return the new ratings', ->
      throw new Error 'Not implemented'

  describe '#postMovieRating()', ->

    it 'should put a new movie with rating into the repo if it does not already exist and return the rating', ->
      throw new Error 'Not implemented'

    it 'should add a new rating to an existing movie in the repo and return the ratings', ->
      throw new Error 'Not implemented'

  describe '#deleteMovieRatings()', ->

    it 'should delete a movie from the ratings repo', ->
      throw new Error 'Not implemented'

    it 'should throw an error when attempting to delete a movie that does not exist', ->
      throw new Error 'Not implemented'