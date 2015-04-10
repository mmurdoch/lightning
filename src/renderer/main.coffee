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

question = ->
  $('.question')

addQuestion = ->
  addElement 'div', 'question', 'Press any key to start'

answer = ->
  $('.answer')

addAnswer = ->
  answer = addElement 'input', 'answer'
  answer.setAttribute 'type', 'text'
  answer.focus()

  # Then first question appears
  # Listen to key presses, waiting until correct answer given
  # Then disable all key presses, show success, wait for a second
  # Then move to next question
  $('.answer').keypress startQuestions

answerCheckerId = null

startQuestions = (event) ->
  event.preventDefault()
  $('.question').text('17 x 87')
  $('.answer').off('keypress')
  $('.answer').keypress allowDigitsOnly
  answerCheckerId = setInterval checkAnswer, 100

checkAnswer = ->
  if $('.answer').val() is '1'
    $('.question').text('Correct!')
    clearInterval answerCheckerId

allowDigitsOnly = (event) ->
  key = event.which

  if !(digits().indexOf(key) >= 0)
    event.preventDefault()

digits = ->
  zeroToNine = []
  for i in [48..58]
    zeroToNine.push(i)
  zeroToNine

multiplications = Multiplication.multiplications(100, 100)
Category.all().map((c) -> addCategoryButton c.name, onCategoryButtonClick)
addCategoryButton 'uncategorized', onCategoryButtonClick

# NeDB
#Datastore = require 'nedb'
#db = new Datastore { filename: 'lightning.db', autoload: true }

#for i in [1..10]
#  doc = { hello: 'world', n: i }

#  db.insert(doc)

#db.find({ hello: 'world' }, (err, docs) ->
#  docs.map((doc) -> console.log doc.n + ' (' + doc._id + ')')
#)
