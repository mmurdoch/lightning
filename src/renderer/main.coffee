Multiplication = require './multiplication'
Category = require './multiplication-category'
$ = require './jquery-1.11.2.min.js'

contentElement = ->
  content = document.getElementById('content')

addElement = (elementName, elementClass, textContent) ->
  element = document.createElement elementName
  element.setAttribute('class', elementClass)
  element.innerText = textContent if textContent
  contentElement().appendChild element

addCategoryButton = (categoryName, onclick) ->
  element = addElement 'a', 'category', categoryName
  element.addEventListener 'click', onclick

onCategoryButtonClick = (event) ->
  while contentElement().hasChildNodes()
    contentElement().removeChild contentElement().lastChild

  addQuestion()
  addAnswer()

addQuestion = ->
  addElement 'div', 'question', 'Press any number to start'

addAnswer = ->
  answer = addElement 'input', 'answer'
  answer.setAttribute 'type', 'text'
  answer.focus()
  $('.answer').keypress((event) ->
    digits = []
    key = event.which
    console.log(key)

    for i in [48..58]
      digits.push(i)

    if !(digits.indexOf(key) >= 0)
      event.preventDefault()
  )

multiplications = Multiplication.multiplications(100, 100)
Category.all().map((c) -> addCategoryButton c.name, onCategoryButtonClick)
addCategoryButton 'uncategorized', onCategoryButtonClick

# NeDB
Datastore = require 'nedb'
db = new Datastore { filename: 'lightning.db', autoload: true }

for i in [1..10]
  doc = { hello: 'world', n: i }

  db.insert(doc)

db.find({ hello: 'world' }, (err, docs) ->
  docs.map((doc) -> console.log doc.n + ' (' + doc._id + ')')
)
