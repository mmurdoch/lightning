# A category of multiplications.
module.exports =
class MultiplicationCategory

  # Creates a category of multiplications.
  #
  # * `name` {String} the name of the category
  # * `membershipCheck` {Function(Multiplication) : Boolean} a function which
  # checks whether or not a multiplication is a member of the category
  constructor: (@name, @membershipCheck) ->

  # Whether or not a multiplication is a member of this category.
  #
  # * `multiplication` {Multiplication} the multiplication to check
  #
  # Returns {Boolean}, true if the multiplication is a member of this category,
  # false otherwise
  contains: (multiplication) ->
    @membershipCheck(multiplication)

  # All multiplication categories.
  #
  # Returns all categories
  @all: -> [
    @byOne(), @byTwo(), @byThree(), @byFour(), @byFive(),
    @bySix(), @bySeven(), @byEight(), @byNine(), @byTen(),
    @byEleven(), @byTwenty(), @byTwentyTwo(), @byThirty(), @byThirtyThree(),
    @byForty(), @byFortyFour(), @byFifty(), @bySixty(), @bySixtySix(),
    @bySeventy(), @bySeventySeven(), @byEighty(), @byEightyEight(),
    @byNinety(), @byNinetyNine(), @byOneHundred(),
    @singleDigits(), @squaresEndingInFive(), @sameTensDigitAndUnitsSumToTen(),
    @closeToTen(), @closeToOneHundred(), @singleDigitFactorization()]

  # Creates a category of multiplications by a specified number.
  #
  # * `name` {String} the name of the category
  # * `number` {Number} the number which is part of the multiplication
  #
  # Returns the created category
  @by: (name, number) ->
    new MultiplicationCategory("by " + name, (m) -> m.contains(number))

  # Creates a category of multiplications by 1.
  #
  # Returns the created category
  @byOne: -> @by("one", 1)

  # Creates a category of multiplications by 2.
  #
  # Returns the created category
  @byTwo: -> @by("two", 2)

  # Creates a category of multiplications by 3.
  #
  # Returns the created category
  @byThree: -> @by("three", 3)

  # Creates a category of multiplications by 4.
  #
  # Returns the created category
  @byFour: -> @by("four", 4)

  # Creates a category of multiplications by 5.
  #
  # Returns the created category
  @byFive: -> @by("five", 5)

  # Creates a category of multiplications by 6.
  #
  # Returns the created category
  @bySix: -> @by("six", 6)

  # Creates a category of multiplications by 7.
  #
  # Returns the created category
  @bySeven: -> @by("seven", 7)

  # Creates a category of multiplications by 8.
  #
  # Returns the created category
  @byEight: -> @by("eight", 8)

  # Creates a category of multiplications by 9.
  #
  # Returns the created category
  @byNine: -> @by("nine", 9)

  # Creates a category of multiplications by 10.
  #
  # Returns the created category
  @byTen: -> @by("ten", 10)

  # Creates a category of multiplications by 11.
  #
  # Returns the created category
  @byEleven: -> @by("eleven", 11)

  # Creates a category of multiplications by 20.
  #
  # Returns the created category
  @byTwenty: -> @by("twenty", 20)

  # Creates a category of multiplications by 22.
  #
  # Returns the created category
  @byTwentyTwo: -> @by("twenty-two", 22)

  # Creates a category of multiplications by 30.
  #
  # Returns the created category
  @byThirty: -> @by("thirty", 30)

  # Creates a category of multiplications by 33.
  #
  # Returns the created category
  @byThirtyThree: -> @by("thirty-three", 33)

  # Creates a category of multiplications by 40.
  #
  # Returns the created category
  @byForty: -> @by("forty", 40)

  # Creates a category of multiplications by 44.
  #
  # Returns the created category
  @byFortyFour: -> @by("forty-four", 44)

  # Creates a category of multiplications by 50.
  #
  # Returns the created category
  @byFifty: -> @by("fifty", 50)

  # Creates a category of multiplications by 55.
  #
  # Returns the created category
  @byFiftyFive: -> @by("fifty-five", 55)

  # Creates a category of multiplications by 60.
  #
  # Returns the created category
  @bySixty: -> @by("sixty", 60)

  # Creates a category of multiplications by 66.
  #
  # Returns the created category
  @bySixtySix: -> @by("sixty-six", 66)

  # Creates a category of multiplications by 70.
  #
  # Returns the created category
  @bySeventy: -> @by("seventy", 70)

  # Creates a category of multiplications by 77.
  #
  # Returns the created category
  @bySeventySeven: -> @by("seventy-seven", 77)

  # Creates a category of multiplications by 80.
  #
  # Returns the created category
  @byEighty: -> @by("eighty", 80)

  # Creates a category of multiplications by 88.
  #
  # Returns the created category
  @byEightyEight: -> @by("eighty-eight", 88)

  # Creates a category of multiplications by 90.
  #
  # Returns the created category
  @byNinety: -> @by("ninety", 90)

  # Creates a category of multiplications by 99.
  #
  # Returns the created category
  @byNinetyNine: -> @by("ninety-nine", 99)

  # Creates a category of multiplications by 100.
  #
  # Returns the created category
  @byOneHundred: -> @by("one hundred", 100)

  # Creates a category of multiplications containing single digits only.
  #
  # Returns the created category
  @singleDigits: ->
    new MultiplicationCategory("single digits", (m) -> m.isSingleDigit())

  # Creates a category of squares with a units digit of 5.
  #
  # Returns the created category
  @squaresEndingInFive: ->
    new MultiplicationCategory(
      "squares ending in five", (m) -> m.isSquareEndingInFive())

  # Creates a category of multiplications in which both numbers have the same
  # tens digit and have units digits which sum to ten.
  #
  # Returns the created category
  @sameTensDigitAndUnitsSumToTen: ->
    new MultiplicationCategory(
      "same tens digit and units sum to ten", (m) ->
        m.hasEqualTensDigit() and m.hasUnitsDigitsWhichSumToTen())

  # Creates a category of multiplications of numbers which are close to ten.
  #
  # Returns the created category
  @closeToTen: ->
    new MultiplicationCategory("close to ten", (m) -> m.isCloseToTen())

  # Creates a category of multiplications of numbers which are close to
  # one hundred.
  #
  # Returns the created category
  @closeToOneHundred: ->
    new MultiplicationCategory("close to one hundred", (m) ->
      m.isCloseToOneHundred())

  # Creates a category of multiplications which contain at least one number
  # which can be factorized into single digit numbers.
  #
  # Returns the created category
  @singleDigitFactorization: ->
    new MultiplicationCategory("single digit factorization", (m) ->
      m.hasSingleDigitFactors())

  # Friendly products
  # Category ranking (from easiest approach to hardest)
  # Chained categorizations (for example, 13x34 = 13x17x2 = 221x2 = 442)
