assert = require 'assert'

MovieRatingsResource = require '../app/movie-ratings'

describe 'MovieRatingsResource', ->

  movieRatings = {}

  beforeEach ->
    movieRatings = new MovieRatingsResource
      'Bladerunner': [5, 1]
      'The Empire Strikes Back': [1, 1, 2, 3, 5]

  describe '#getAllMovieRatings()', ->
    it 'should return the correct set of all movie ratings', ->
      assert.deepEqual movieRatings.getAllMovieRatings(),
        'Bladerunner': [5, 1]
        'The Empire Strikes Back': [1, 1, 2, 3, 5]

  describe '#getMovieRatings()', ->
    it 'should return the correct movie ratings for the requested movie', ->
      assert.deepEqual movieRatings.getMovieRatings('Bladerunner'), [5, 1]
    it 'should throw an error if the requested movie does not exist in the repo', ->
      assert.throws -> movieRatings.getMovieRatings 'Nonexistant movie'

  describe '#putMovieRatings()', ->
    it 'should put a new movie with ratings into the repo and return the ratings', ->
      assert.throws -> movieRatings.getMovieRatings 'Star Wars Episode 7'
      movieRatings.putMovieRatings 'Star Wars Episode 7', [5, 1]
      assert.deepEqual movieRatings.getMovieRatings('Star Wars Episode 7'), [5, 1]
    it 'should overwrite the ratings of an existing movie in the repo and return the new ratings', ->
      assert.deepEqual movieRatings.getMovieRatings('Bladerunner'), [5, 1]
      movieRatings.putMovieRatings 'Bladerunner', [6, 3, 1]
      assert.notDeepEqual movieRatings.getMovieRatings('Bladerunner'), [5, 1]
      assert.deepEqual movieRatings.getMovieRatings('Bladerunner'), [6, 3, 1]

  describe '#postMovieRating()', ->
    it 'should put a new movie with rating into the repo if it does not already exist and return the rating', ->
      assert.throws -> movieRatings.getMovieRatings 'Star Wars Episode 7'
      movieRatings.postMovieRating 'Star Wars Episode 7', 5
      assert.deepEqual movieRatings.getMovieRatings('Star Wars Episode 7'), [5]
    it 'should add a new rating to an existing movie in the repo and return the ratings', ->
      assert.deepEqual movieRatings.getMovieRatings('Bladerunner'), [5, 1]
      movieRatings.postMovieRating 'Bladerunner', 6
      assert.deepEqual movieRatings.getMovieRatings('Bladerunner'), [5, 1, 6]

  describe '#deleteMovieRatings()', ->
    it 'should delete a movie from the ratings repo', ->
      assert.ok movieRatings.getMovieRatings 'Bladerunner'
      movieRatings.deleteMovieRatings 'Bladerunner'
      assert.throws -> movieRatings.getMovieRatings 'Bladerunner'
    it 'should throw an error when attempting to delete a movie that does not exist', ->
      assert.throws -> movieRatings.deleteMovieRatings 'Movie that does not exist'