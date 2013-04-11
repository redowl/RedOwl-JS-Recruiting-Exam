requirejs.config
  baseUrl: '/javascripts'
  paths:
    vendor: './vendor'
  shim:
    'vendor/jquery':
      exports: 'jQuery'
    'vendor/underscore':
      exports: '_'
    'vendor/handlebars':
      exports: 'Handlebars'

dependencies = [
  'vendor/jquery'
  'vendor/underscore'
  'vendor/handlebars'
  'movie-ratings-service-client'
]

requirejs dependencies, ($, _, Handlebars, ratingsService) ->

  movieRatingsTemplate = """
                         <div class="movie-ratings">
                           {{movieRatings}}
                         </div>
                         """
  ratedMovieTemplate = """
                       <div class="rated-movie">
                         {{movieName}}: {{rating}}
                       </div>
                       """

  movieRatingsSection = Handlebars.compile movieRatingsTemplate
  ratedMovieSection = Handlebars.compile ratedMovieTemplate

  ratingsService.getAllMovieRatings (ratings) ->
    $('body').append movieRatingsSection { movieRatings: JSON.stringify ratings }
    for movie of ratings
      do (movie) ->
        ratingsService.getMovieRating movie, (rating) ->
          $('body').append ratedMovieSection { movieName: movie, rating: rating }