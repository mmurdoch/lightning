Multiplication = require '../src/renderer/multiplication'
Category = require '../src/renderer/multiplication-category'

describe "Lightning", ->
  describe "Multiplications", ->
    tablesTo100 = Multiplication.multiplications(100, 100)

    it "can create multiplications", ->
      expect(tablesTo100.length).toBe 10000
    it "can filter multiplications", ->
      expect(tablesTo100.inCategory(Category.byOne()).length).toBe 199
    it "can filter to multiplications which are uncategorized", ->
      expect(tablesTo100.uncategorized().length).toBe 2245
