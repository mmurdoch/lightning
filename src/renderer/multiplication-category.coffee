module.exports =
class MultiplicationCategory

  constructor: (@name, @membershipCheck) ->

  contains: (multiplication) ->
    @membershipCheck(multiplication)

  @all: -> [
    @byOne(), @byTwo(), @byThree(), @byFour(), @byFive(),
    @bySix(), @bySeven(), @byEight(), @byNine(), @byTen(),
    @byEleven(), @byTwenty(), @byTwentyTwo(), @byThirty(), @byThirtyThree(),
    @byForty(), @byFortyFour(), @byFifty(), @bySixty(), @bySixtySix(),
    @bySeventy(), @bySeventySeven(), @byEighty(), @byEightyEight(),
    @byNinety(), @byNinetyNine(), @byOneHundred(),
    @singleDigits(), @squaresEndingInFive(), @sameTensDigitAndUnitsSumToTen(),
    @closeToTen(), @closeToOneHundred(), @singleDigitFactorization()]

  @by: (name, number) ->
    new MultiplicationCategory("by " + name, (m) -> m.contains(number))

  @byOne: -> @by("one", 1)

  @byTwo: -> @by("two", 2)

  @byThree: -> @by("three", 3)

  @byFour: -> @by("four", 4)

  @byFive: -> @by("five", 5)

  @bySix: -> @by("six", 6)

  @bySeven: -> @by("seven", 7)

  @byEight: -> @by("eight", 8)

  @byNine: -> @by("nine", 9)

  @byTen: -> @by("ten", 10)

  @byEleven: -> @by("eleven", 11)

  @byTwenty: -> @by("twenty", 20)

  @byTwentyTwo: -> @by("twenty-two", 22)

  @byThirty: -> @by("thirty", 30)

  @byThirtyThree: -> @by("thirty-three", 33)

  @byForty: -> @by("forty", 40)

  @byFortyFour: -> @by("forty-four", 44)

  @byFifty: -> @by("fifty", 50)

  @byFiftyFive: -> @by("fifty-five", 55)

  @bySixty: -> @by("sixty", 60)

  @bySixtySix: -> @by("sixty-six", 66)

  @bySeventy: -> @by("seventy", 70)

  @bySeventySeven: -> @by("seventy-seven", 77)

  @byEighty: -> @by("eighty", 80)

  @byEightyEight: -> @by("eighty-eight", 88)

  @byNinety: -> @by("ninety", 90)

  @byNinetyNine: -> @by("ninety-nine", 99)

  @byOneHundred: -> @by("one hundred", 100)

  @singleDigits: ->
    new MultiplicationCategory("single digits", (m) -> m.isSingleDigit())

  @squaresEndingInFive: ->
    new MultiplicationCategory(
      "squares ending in five", (m) -> m.isSquareEndingInFive())

  @sameTensDigitAndUnitsSumToTen: ->
    new MultiplicationCategory(
      "same tens digit and units sum to ten", (m) ->
        m.hasEqualTensDigit() and m.hasUnitsDigitsWhichSumToTen())

  @closeToTen: ->
    new MultiplicationCategory("close to ten", (m) -> m.isCloseToTen())

  @closeToOneHundred: ->
    new MultiplicationCategory("close to one hundred", (m) ->
      m.isCloseToOneHundred())

  @singleDigitFactorization: ->
    new MultiplicationCategory("single digit factorization", (m) ->
      m.hasSingleDigitFactors())

  # Friendly products
  # Category ranking (from easiest approach to hardest)
  # Chained categorizations (for example, 13x34 = 13x17x2 = 221x2 = 442)
