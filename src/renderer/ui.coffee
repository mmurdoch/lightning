Multiplication = require './multiplication'
Category = require './multiplication-category'
$ = require './jquery-1.11.2.min.js'

# The Lightning UI.
module.exports =
class Ui

  # Creates a UI.
  constructor: ->
    multiplications = Multiplication.multiplications(100, 100)
    for category in Category.all()
      @addCategoryButton(category.name)
    @addCategoryButton 'uncategorized'

  # Returns the element into which content is injected.
  content: ->
    $('#content')

  # Returns the element into which questions are injected.
  question: ->
    $('.question')

  # Returns the element into which the user inputs answers.
  answer: ->
    $('.answer')

  # Converts a string to a valid HTML ID.
  #
  # * `string` {String} the string to convert
  #
  # Returns the HTML ID
  toId: (string) ->
    string.replace(' ', '-')

  # Adds a category button to the content element. The user clicks
  # one of these to select the category of multiplications they wish
  # to train.
  #
  # * `categoryName` {String} the name of the category
  addCategoryButton: (categoryName) ->
    categoryId = @toId(categoryName)
    @content().append(
      $('<a id="' + categoryId + '" class="category">' + categoryName + '</a>'))
    that = this
    $('#' + categoryId).click (event) -> that.onCategoryButtonClick(event)

  # The action to perform when the user clicks a category.
  #
  # * `event` {OnClickEvent} details of the click event
  onCategoryButtonClick: (event) ->
    @content().empty()
    @addQuestion()
    @addAnswer()

  # Adds a div to the content area for displaying questions to the user.
  addQuestion: ->
    @content().append(
      $('<div class="question">Press any key to start</div>'))

  # Adds an input to the content area into which the user will type answers.
  addAnswer: ->
    @content().append($('<input type="text" class="answer"/>'))
    @answer().focus()
    that = this
    @answer().keypress (event) -> that.startQuestions(event)

    # When first question appears:
    # Listen to key presses, waiting until correct answer given
    # Then disable all key presses, show success, wait for a second
    # Then move to next question

  answerCheckerId = null

  # Displays the first question to the user.
  #
  # * `event` {OnKeypressEvent} details of the key press event which prompted
  # question initiation
  startQuestions: (event) ->
    event.preventDefault()
    @question().text('17 x 87')
    @answer().off('keypress')
    that = this
    @answer().keypress (event) -> that.allowDigitsOnly(event)
    checkAnswerFunction = -> that.checkAnswer()
    @answerCheckerId = setInterval checkAnswerFunction, 100

  # Checks whether or not the user has successfully answered the current
  # question.
  checkAnswer: ->
    if @answer().val() is '1'
      @question().text('Correct!')
      clearInterval @answerCheckerId

  # Allows the capture of digit key presses only.
  #
  # * `event` {OnKeypressEvent} details of the current key press event
  allowDigitsOnly: (event) ->
    key = event.which

    if !(@digitKeyCodes().indexOf(key) >= 0)
      event.preventDefault()

  # The key codes of the digits 0 to 9
  #
  # Returns an {Array} of {Numbers} containing the key codes of digits 0 to 9.
  digitKeyCodes: ->
    zeroToNine = []
    for i in [48..57]
      zeroToNine.push(i)
    zeroToNine

# NeDB
#Datastore = require 'nedb'
#db = new Datastore { filename: 'lightning.db', autoload: true }

#for i in [1..10]
#  doc = { hello: 'world', n: i }

#  db.insert(doc)

#db.find({ hello: 'world' }, (err, docs) ->
#  docs.map((doc) -> console.log doc.n + ' (' + doc._id + ')')
#)
