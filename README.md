RedOwl Recruiting Exam
======================

This exam should cover the following skills:

* Familiarity with cloning a git repository
* Familiarity with algorithmic thinking
* Familiarity with unit testing concepts
* Familiarity with web application structure
* Familiarity with basic JavaScript libraries

Getting Started
---------------

1.  Set up [git](http://help.github.com/) and clone the repository INSERT REPO LOCATION HERE. We'll leave the details
    for you to work out.

2.  Install the latest [Node.js](http://nodejs.org/) and ensure that you have the
    Node Package Manager (npm) installed as well.

    Hint: You should be able to run the following commands:

    * `$ node -v` #(prints the version of node.js installed)
    * `$ npm -v` #(prints the version of npm installed)

3.  Install the Node.js [CoffeeScript](http://coffeescript.org/) module globally using npm:
    `` `$ npm install -g coffee-script` `` (depending on your system, this may require the use of sudo)

4.  Install the Node.js [Mocha](http://visionmedia.github.io/mocha/) module globally using npm:
    `` `$ npm install -g mocha` `` (you will likely need to sudo again)

5.  Use npm to install all of the web application dependencies. Simple execute `` `$ npm install` `` in
    the root directory of the application you cloned from git.

6.  Verify that everything works and is ready to go by running the following commands:

    * `` `$ coffee -v` `` #(prints the version of coffeescript installed)
    * `` `$ mocha --compilers coffee:coffee-script` `` #(executes the unit test procedures and result in 15 test failures)
    * `` `$ coffee web.coffee` `` #(will start the web application and print `Server listening on port 3000`)

      Hint: Use ctrl-c to terminate the web app process.

Your mission, should you choose to accept it
--------------------------------------------

You're working for a company that has an online movie database. Users can submit integer valued ratings of movies that
they have watched. The lead analyst wants to try out a new way of aggregating all of these ratings by using a trimmed
average. For a trimmed average, you must remove all minimal and maximal values from a mean before calculating the
average. So, for example,

TrimmedAverage(1,1,2,2,3,4,4,5,5,5) = Average(2,2,3,4,4) = 3

Since this analyst is a really good product owner, she was nice enough to write you a set of unit tests! You can find
the tests in the test directory of the app: `test/movie-rater-test.coffee`. She's even written you a function stub to
get started (see `app/movie-rater.coffee`). You'll just have to implement the trimmed average inside of the function
--taking care to throw Errors when not enough ratings are given or when the input is invalid--and you're done once the
movie rater unit tests pass (run `` `$ mocha --compilers coffee:coffee-script` `` and you should not see any tests fail
with movieRater() in the name).

If you're really an over-achiever (bonus points here), you'll figure out how to implement this function with a constant
amount of memory with respect to the elements in the ratings parameter AND with a single pass over the ratings.

You did such a great job implementing the movie rater...
--------------------------------------------------------

...that the lead engineer wants you to go back and unit test the movie database's data access object
`app/movie-ratings.coffee`. He has already written unit test stubs in `test/movie-ratings-test.coffee`. You will know you
are done when you can run `` `$ mocha --compilers coffee:coffee-script` `` multiple times and all of the tests pass.

Hint: The MovieRatingsResource does not guarantee the order that ratings are returned is the same as the order they
are inserted, and your unit tests should handle these cases.

**NOTE: You should not modify any code outside of `app/movie-rater.coffee` and `test/movie-ratings-test.coffee` for this
section!**

Bonus Time! Let your creative flag fly
--------------------------------------

Now that you have implemented the movie rater and tested the movie ratings data access object, your company is ready to
unveil their product! It is a web app that displays the stored movie ratings and the trimmed average of those ratings.
The web app runs on Node.js using the [Express.js](http://expressjs.com/) framework. The engineering team has built a
basic RESTful API for accessing and manipulating stored movie ratings data that uses the movie ratings access object
that you helped test. There is also an http endpoint for calculating the trimmed average of a collection of ratings that
uses the movie rater that you created. `web.coffee` contains all of your application's routes, and you can start the
server through the command `` `$ coffee web.coffee` ``. You can view the client by navigating to `localhost:3000` in
your web browser.

Boy, that sure is a beautiful UI, isn't it? Now, it is your chance to show how creative you are by improving it! The
UI is a client side JavaScript application (compiled from CoffeeScript). The client app uses RequireJS for modular code
and comes equipped with [jQuery](http://jquery.com/), [Underscore](http://underscorejs.org/), and
[Handlebars](http://handlebarsjs.com/). The only limit is that you cannot modify `app/views/layout.hbs`.

Some useful hints:

* To compile the CoffeeScript files into JavaScript files use the `` `$ coffee --compile --output ./assets/javascripts/ ./app/assets/coffeescripts/` ``
  command. You can also use the `--watch` flag to have the compiler run in the background and compile whenever you save
  changes to your CoffeeScript.
* You can use the [Sass](http://sass-lang.com/) to create simplified stylesheets that are compiled into CSS.
* It would be great to upgrade the movie-ratings-service-client to take advantage of the full RESTful API provided by
  the application, and then provide the client UI to allow the user to add/modify/delete ratings interactively.