Multiplication = require './multiplication'
Category = require './multiplication-category'

addElement = (elementName, elementClass, textContent) ->
  element = document.createElement elementName
  element.setAttribute('class', elementClass)
  element.innerText = textContent
  content = document.getElementById('content')
  content.appendChild element

addCategoryButton = (categoryName, onclick) ->
  element = addElement 'a', 'category', categoryName
  element.addEventListener 'click', onclick

onCategoryButtonClick = (event) ->
  console.log 'clicked ' + event.target.innerText

multiplications = Multiplication.multiplications(100, 100)
Category.all().map((c) -> addCategoryButton c.name, onCategoryButtonClick)
addCategoryButton('uncategorized', onCategoryButtonClick)

# NeDB
Datastore = require('nedb')
db = new Datastore({ filename: 'lightning.db', autoload: true })

for i in [1..10]
  doc = { hello: 'world', n: i }

  db.insert(doc)

db.find({ hello: 'world' }, (err, docs) ->
  docs.map((doc) -> console.log doc.n + ' (' + doc._id + ')')
)
