Multiplications = require './multiplications'
MultiplicationCategory = require './multiplication-category'

# A multiplication of two numbers.
module.exports =
class Multiplication
  # Creates all multiplications from 1 to the specified maximums.
  #
  # * `maximumMultiplier` {Number} the maximum value of the multiplier
  # * `maximumMultiplicand` {Number} the maximum value of the multiplicand
  #
  # Returns the created {Multiplications}
  @multiplications: (maximumMultiplier, maximumMultiplicand) ->
    multiplications = []

    for i in [1..maximumMultiplier]
      for j in [1..maximumMultiplicand]
        multiplication = new Multiplication(i, j, MultiplicationCategory.all())
        multiplications.push multiplication

    return new Multiplications(multiplications)

  # Generates all factors of an integer.
  #
  # * `number` {Number} the integer to factorize
  #
  # Returns an {Array} of {Number} integer factors
  @factorize: (number) ->
    factors = []
    for i in [1..number]
      if number % i is 0
        factors.push new Multiplication(i, number/i)

    factors

  # Creates a multiplication.
  #
  # * `multiplier` {Number} the integer multiplier
  # * `multiplicand` {Number} the integer multiplicand
  # * `allCategories` {Array of MultiplicationCategory} all available
  # categories to which the multiplication may apply
  #
  # Return the created multiplication, assigned to the relevant categories
  constructor: (@multiplier, @multiplicand, allCategories) ->
    multiplication = this
    allCategories = allCategories || []
    @categories = allCategories.filter((c) -> c.contains(multiplication))

  # Whether or not this multiplication is equal to another.
  #
  # * `multiplication` {Multiplication} the other multiplication to compare
  #
  # Returns {Boolean}, true if the two multiplications are identical,
  # false otherwise
  equals: (multiplication) ->
    @multiplier is multiplication.multiplier and
      @multiplicand is multiplication.multiplicand

  # Whether or not this multiplication contains the specified number as
  # a multiplier or multiplicand.
  #
  # * `number` {Number} the number to check
  #
  # Returns {Boolean}, true if this multiplication contains the number,
  # false otherwise
  contains: (number) ->
    @multiplier is number or @multiplicand is number

  # Whether or not this multiplication is in the specified category.
  #
  # * `category` {MultiplicationCategory} the category to check
  #
  # Returns {Boolean}, true if this multiplication is in the specified
  # category, false otherwise
  isInCategory: (category) ->
    @categories.some((c) -> c.name is category.name)

  # Whether or not this multiplication is between two single digit
  # integers only.
  #
  # Returns {Boolean}, true if this is a single digit multiplication,
  # false otherwise
  isSingleDigit: ->
    @multiplier < 10 and @multiplicand < 10

  # Whether or not this multiplication is between two two-digit integers only.
  #
  # Returns {Boolean}, true if this is a two-digit multiplication,
  # false otherwise
  isTwoDigit: ->
    @multiplier >= 10 and @multiplicand >= 10

  # Whether or not this multiplication is between two identical integers
  # (a square).
  #
  # Returns {Boolean}, true if this multiplication is a square, false otherwise
  isSquare: ->
    @multiplier is @multiplicand

  # Whether or not this multiplication is a square which has a units' digit of
  # five.
  #
  # Returns {Boolean}, true if this multiplication is a square ending in five,
  # false otherwise
  isSquareEndingInFive: ->
    this.isSquare() and @multiplier % 10 is 5

  # Whether or not this multiplication is between two integers with the same
  # tens digit.
  #
  # Returns {Boolean}, true if this multiplication is between two integers with
  # the same tens digit, false otherwise
  hasEqualTensDigit: ->
    Math.floor(@multiplier / 10) is Math.floor(@multiplicand / 10)

  # Whether or not this multiplication is between two integers which have units'
  # digits which sum to ten.
  #
  # Returns {Boolean}, true if this multiplication is between two integers which
  # have units' digits which sum to ten, false otherwise
  hasUnitsDigitsWhichSumToTen: ->
    @multiplier % 10 + @multiplicand % 10 is 10

  # Whether or not this multiplication is between two integers which are close
  # to ten (i.e. twenty or less).
  #
  # Returns {Boolean}, true if this multiplication is close to ten,
  # false otherwise
  isCloseToTen: ->
    @multiplier <= 20 and @multiplicand <= 20

  # Whether or not this multiplication is between two integers which are close
  # to one hundred (i.e. greater than or equal to ninety and less than or
  # equal to one hundred and ten).
  #
  # Returns {Boolean}, true if this multiplication is close to one hundred,
  # false otherwise
  isCloseToOneHundred: ->
    @multiplier >= 90 and @multiplicand >= 90 and
      @multiplier <= 110 and @multiplicand <= 110

  # Whether or not this multiplication contains at least one number which can
  # be factorized into single digit integers.
  #
  # Returns {Boolean}, true if this multiplication has a number with single
  # digit factors, false otherwise
  hasSingleDigitFactors: ->
    for number in [@multiplier, @multiplicand]
      for factor in Multiplication.factorize(number)
        if factor.isSingleDigit()
          return true

    return false
