_ = require 'underscore'
assert = require 'assert'

assert.nearlyEquals = (actual, expected, delta) ->
  throw new Error 'Not finite' if not isFinite(actual) or not isFinite(expected)
  throw new Error 'Not a number' if isNaN(actual) or isNaN(expected)
  return if actual is expected
  return if actual.toPrecision(15) is expected.toPrecision(15)
  throw new Error 'Not equal' unless Math.abs(expected - actual) <= delta

movieRater = require '../app/movie-rater'

describe '#movieRater()', ->

  it 'should throw an error when passed anything but a single array', ->
    assert.throws (-> movieRater 1), /Invalid arguments/
    assert.throws (-> movieRater {}), /Invalid arguments/
    assert.throws (-> movieRater true), /Invalid arguments/
    assert.throws (-> movieRater '[1]'), /Invalid arguments/
    assert.throws (-> movieRater [1], [1]), /Invalid arguments/

  it 'should throw an error when zero ratings are passed', ->
    assert.throws (-> movieRater []), /Not enough ratings/

  it 'should throw an error when one rating is passed', ->
    assert.throws (-> movieRater [1]), /Not enough ratings/

  it 'should throw an error when two ratings are passed', ->
    assert.throws (-> movieRater [1, 2]), /Not enough ratings/

  it 'should throw an error when only two unique ratings are passed', ->
    assert.throws (-> movieRater [5, 5, 5, 7, 7]), /Not enough ratings/

  it 'should properly calculate a trimmed average from valid ratings', ->
    assert.nearlyEquals movieRater([-2, -2, 3, 7, 8, 9, 15, 15, 15]), 6.75, 0.0000001