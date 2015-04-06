module.exports =
class Multiplications
    constructor: (@multiplications) ->
      @length = @multiplications.length

    inCategory: (category) ->
      new Multiplications(@multiplications.filter((m) -> m.isInCategory(category)))

    uncategorized: ->
      new Multiplications(
        @multiplications.filter((m) -> m.categories.length is 0))

    map: (mapFunction) ->
      @multiplications.map(mapFunction)
