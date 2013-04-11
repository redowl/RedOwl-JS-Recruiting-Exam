module.exports = (ratings) ->
  throw new Error 'Invalid arguments' if arguments.length is 0 or arguments.length > 1
  throw new Error 'Invalid arguments' unless ratings instanceof Array

  minRating = Number.MAX_VALUE
  maxRating = -Number.MAX_VALUE

  minRatingCount = maxRatingCount = total = 0

  for rating in ratings
    if rating < minRating
      minRating = rating
      minRatingCount = 1
    else if rating is minRating
      minRatingCount++

    if rating > maxRating
      maxRating = rating
      maxRatingCount = 1
    else if rating is maxRating
      maxRatingCount++

    total += rating

  throw new Error 'Not enough ratings' if minRating is maxRating or ratings.length <= (minRatingCount + maxRatingCount)

  ratingCount = ratings.length - (minRatingCount + maxRatingCount)
  total -= (minRating * minRatingCount) + (maxRating * maxRatingCount)

  total / ratingCount