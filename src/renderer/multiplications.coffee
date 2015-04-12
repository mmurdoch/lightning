# A set of multiplications.
module.exports =
class Multiplications

    # Creates a set of multiplications.
    #
    # * `multiplications` {Array of Multiplication} the set of multiplications
    constructor: (@multiplications) ->
      @length = @multiplications.length

    # All multiplications in the specified category.
    #
    # * `category` {MultiplicationCategory} the filtering category
    #
    # Returns a subset of the multiplications which are in the category
    inCategory: (category) ->
      new Multiplications(@multiplications.filter((m) -> m.isInCategory(category)))

    # All uncategorized multiplications.
    #
    # Returns the subset of multiplications which have no category
    uncategorized: ->
      new Multiplications(
        @multiplications.filter((m) -> m.categories.length is 0))

    # Applies a function to all the contained multiplications.
    #
    # * `mapFunction` {Function(Multiplication)} the function to apply
    map: (mapFunction) ->
      @multiplications.map(mapFunction)
