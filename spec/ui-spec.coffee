Ui = require '../src/renderer/ui'

describe "Lightning", ->
  describe "Ui", ->
    it "can identify digit key codes from zero to nine", ->
      digitKeyCodes = new Ui().digitKeyCodes()
      expect(digitKeyCodes.length).toBe 10
      expect(digitKeyCodes[0]).toBe 48
      expect(digitKeyCodes[9]).toBe 57
