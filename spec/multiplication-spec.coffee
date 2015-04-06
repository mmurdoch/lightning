Multiplication = require '../src/renderer/multiplication'
Category = require '../src/renderer/multiplication-category'

describe "Lightning", ->
  describe "Multiplication", ->
    it "can determine if multiplication is a square with a units digit of five", ->
      expect(new Multiplication(25, 25).isSquareEndingInFive()).toBe true
      expect(new Multiplication(65, 25).isSquareEndingInFive(65, 25)).toBe false
      expect(new Multiplication(46, 46).isSquareEndingInFive()).toBe false
    it "can determine if the two numbers have units digits which sum to ten", ->
      expect(new Multiplication(3, 7).hasUnitsDigitsWhichSumToTen()).toBe true
      expect(new Multiplication(15, 5).hasUnitsDigitsWhichSumToTen()).toBe true
      expect(new Multiplication(36, 94).hasUnitsDigitsWhichSumToTen()).toBe true
      expect(new Multiplication(43, 49).hasUnitsDigitsWhichSumToTen()).toBe false
      expect(new Multiplication(34, 54).hasUnitsDigitsWhichSumToTen()).toBe false
    it "can determine if the two numbers have the same tens digits", ->
      expect(new Multiplication(14, 16).hasEqualTensDigit()).toBe true
      expect(new Multiplication(10, 10).hasEqualTensDigit()).toBe true
      expect(new Multiplication(35, 26).hasEqualTensDigit()).toBe false
    it "can determine whether it has any single digit factors", ->
      expect(new Multiplication(21, 61).hasSingleDigitFactors()).toBe true
      expect(new Multiplication(71, 51).hasSingleDigitFactors()).toBe false
      expect(new Multiplication(71, 53).hasSingleDigitFactors()).toBe false
    it "can be categorized", ->
      multiplication = new Multiplication(56, 11, [Category.byEleven()])
      expect(multiplication.isInCategory(Category.byEleven())).toBe true
