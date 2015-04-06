Multiplications = require './multiplications'
MultiplicationCategory = require './multiplication-category'

module.exports =
class Multiplication
  @multiplications: (maximumMultiplier, maximumMultiplicand) ->
    multiplications = []

    for i in [1..maximumMultiplier]
      for j in [1..maximumMultiplicand]
        multiplication = new Multiplication(i, j, MultiplicationCategory.all())
        multiplications.push multiplication

    return new Multiplications(multiplications)

  @factorize: (number) ->
    factors = []
    for i in [1..number]
      if number % i is 0
        factors.push new Multiplication(i, number/i)

    factors

  constructor: (@multiplier, @multiplicand, allCategories) ->
    multiplication = this
    allCategories = allCategories || []
    @categories = allCategories.filter((c) -> c.contains(multiplication))

  equals: (multiplication) ->
    @multiplier is multiplication.multiplier and
      @multiplicand is multiplication.multiplicand

  contains: (number) ->
    @multiplier is number or @multiplicand is number

  isInCategory: (category) ->
    @categories.some((c) -> c.name is category.name)

  isSingleDigit: ->
    @multiplier < 10 and @multiplicand < 10

  isTwoDigit: ->
    @multiplier >= 10 and @multiplicand >= 10

  isSquare: ->
    @multiplier is @multiplicand

  isSquareEndingInFive: ->
    this.isSquare() and @multiplier % 10 is 5

  hasEqualTensDigit: ->
    Math.floor(@multiplier / 10) is Math.floor(@multiplicand / 10)

  hasUnitsDigitsWhichSumToTen: ->
    @multiplier % 10 + @multiplicand % 10 is 10

  isCloseToTen: ->
    @multiplier <= 20 and @multiplicand <= 20

  isCloseToOneHundred: ->
    @multiplier >= 80 and @multiplicand >= 80

  hasSingleDigitFactors: ->
    for number in [@multiplier, @multiplicand]
      for factor in Multiplication.factorize(number)
        if factor.isSingleDigit()
          return true

    return false
