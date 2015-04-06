Multiplication = require './multiplication'
Category = require './multiplication-category'

print = (elementName, textContent) ->
  element = document.createElement elementName
  element.innerText = textContent
  document.body.appendChild element

printMultiplication = (multiplication) ->
  print('p', multiplication.multiplier + ' x ' + multiplication.multiplicand)

printMultiplications = (arrayName, multiplications, printAll) ->
  print('h1', arrayName + ': ' + multiplications.length)
  if printAll
    multiplications.map(printMultiplication, this)

multiplications = Multiplication.multiplications(100, 100)
Category.all().map((c) ->
  printMultiplications(c.name, multiplications.inCategory(c)))

printMultiplications("uncategorized", multiplications.uncategorized(), true)
