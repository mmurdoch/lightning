Multiplication = require '../src/renderer/multiplication'
Category = require '../src/renderer/multiplication-category'

describe "Lightning", ->
  describe "MultiplicationCategory", ->
    it "can provide all multiplication categories", ->
      expect(Category.all().length).toBe 33
    it "can determine whether a multiplication is by one", ->
      expect(Category.byOne().contains(
        new Multiplication(1, 22))).toBe true
      expect(Category.byOne().contains(
        new Multiplication(67, 1))).toBe true
      expect(Category.byOne().contains(
        new Multiplication(9, 2))).toBe false
    it "can determine whether a multiplication is by eleven", ->
      expect(Category.byEleven().contains(
        new Multiplication(2, 11))).toBe true
      expect(Category.byEleven().contains(
        new Multiplication(11, 98))).toBe true
      expect(Category.byEleven().contains(
        new Multiplication(54, 16))).toBe false
    it "can determine whether a multiplication is single digits", ->
      expect(Category.singleDigits().contains(
        new Multiplication(4, 5))).toBe true
      expect(Category.singleDigits().contains(
        new Multiplication(14, 5))).toBe false
      expect(Category.singleDigits().contains(
        new Multiplication(55, 19))).toBe false
    it "can determine whether a multiplication is a square ending in five", ->
      expect(Category.squaresEndingInFive().contains(
        new Multiplication(25, 25))).toBe true
      expect(Category.squaresEndingInFive().contains(
        new Multiplication(94, 95))).toBe false
    it "can determine whether a multiplication as the same tens digit and units which sum to ten", ->
      expect(Category.sameTensDigitAndUnitsSumToTen().contains(
        new Multiplication(78, 72))).toBe true
      expect(Category.sameTensDigitAndUnitsSumToTen().contains(
        new Multiplication(43, 46))).toBe false
      expect(Category.sameTensDigitAndUnitsSumToTen().contains(
        new Multiplication(43, 67))).toBe false
    it "can determine whether a multiplication is close to ten", ->
      expect(Category.closeToTen().contains(
        new Multiplication(12, 16))).toBe true
      expect(Category.closeToTen().contains(
        new Multiplication(21, 34))).toBe false
    it "can determine whether a multiplication is close to one hundred", ->
      expect(Category.closeToOneHundred().contains(
        new Multiplication(98, 97))).toBe true
      expect(Category.closeToOneHundred().contains(
        new Multiplication(98, 23))).toBe false
    it "can determine whether a multiplication can undergo single digit factorization", ->
      expect(Category.singleDigitFactorization().contains(
        new Multiplication(42, 19))).toBe true
      expect(Category.singleDigitFactorization().contains(
        new Multiplication(83, 56))).toBe true
      expect(Category.singleDigitFactorization().contains(
        new Multiplication(23, 91))).toBe false
