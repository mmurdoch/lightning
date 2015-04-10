Multiplication = require './multiplication'
Category = require './multiplication-category'
$ = require './jquery-1.11.2.min.js'

content = ->
  $('#content')

question = ->
  $('.question')

answer = ->
  $('.answer')

toId = (string) ->
  string.replace(' ', '-')

addCategoryButton = (categoryName) ->
  categoryId = toId(categoryName)
  content().append(
    $('<a id="' + categoryId + '" class="category">' + categoryName + '</a>'))
  $('#' + categoryId).click onCategoryButtonClick

onCategoryButtonClick = (event) ->
  content().empty()
  addQuestion()
  addAnswer()

addQuestion = ->
  content().append($('<div class="question">Press any key to start</div>'))

addAnswer = ->
  content().append($('<input type="text" class="answer"/>'))
  answer().focus()
  answer().keypress startQuestions

  # Then first question appears
  # Listen to key presses, waiting until correct answer given
  # Then disable all key presses, show success, wait for a second
  # Then move to next question

answerCheckerId = null

startQuestions = (event) ->
  event.preventDefault()
  question().text('17 x 87')
  answer().off('keypress')
  answer().keypress allowDigitsOnly
  answerCheckerId = setInterval checkAnswer, 100

checkAnswer = ->
  if answer().val() is '1'
    question().text('Correct!')
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
Category.all().map((c) -> addCategoryButton c.name)
addCategoryButton 'uncategorized'

# NeDB
#Datastore = require 'nedb'
#db = new Datastore { filename: 'lightning.db', autoload: true }

#for i in [1..10]
#  doc = { hello: 'world', n: i }

#  db.insert(doc)

#db.find({ hello: 'world' }, (err, docs) ->
#  docs.map((doc) -> console.log doc.n + ' (' + doc._id + ')')
#)
