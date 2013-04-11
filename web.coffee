express = require 'express'
MovieRatings = require './app/movie-ratings'
rateMovie = require './app/movie-rater'

app = express()

app.set 'view engine', 'hbs'
app.set 'views', __dirname + '/app/views'
app.use express.static __dirname + '/assets'
app.use express.favicon __dirname + '/assets/images/favicon.ico'

app.use express.logger 'dev'
app.use express.bodyParser()

app.get '/', (request, response) ->
  response.render 'layout'

# Movie ratings api
movieRatings = new MovieRatings
  'Bladerunner': [5, 1, 2, 3, 4]
  'The Empire Strikes Back': [1, 1, 2, 3, 5]

app.get '/api/movieratings', (request, response) ->
  console.log "Getting all movie ratings from repo."
  response.json movieRatings.getAllMovieRatings()

app.get '/api/movieratings/:id', (request, response) ->
  console.log "Getting ratings for movie #{request.params.id} from repo."
  try
    response.json movieRatings.getMovieRatings request.params.id
  catch error
    response.status(404).json { error: error.toString() }

app.put '/api/movieratings/:id', (request, response) ->
  console.log "Putting movie named #{request.params.id} with ratings [#{request.body.ratings}] into repo."
  response.json movieRatings.putMovieRatings request.params.id, request.body.ratings

app.post '/api/movieratings/:id', (request, response) ->
  console.log "Adding rating of #{request.body.rating} to movie named #{request.params.id} in repo."
  response.json movieRatings.postMovieRating request.params.id, request.body.rating

app.delete '/api/movieratings/:id', (request, response) ->
  console.log "Deleting movie #{request.params.id} from repo."
  try
    response.json movieRatings.deleteMovieRatings request.params.id
  catch error
    response.status(404).json { error: error.toString() }

# Movie rater api
app.get '/api/ratemovie/:id', (request, response) ->
  try
    response.json rateMovie movieRatings.getMovieRatings request.params.id
  catch error
    response.status(404).json { error: error.toString() }

app.listen 3000
console.log 'Server listening on port 3000'
