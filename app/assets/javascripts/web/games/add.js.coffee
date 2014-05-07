class @AddPlay
  constructor: ->
    $('#search_key').on 'keydown', @search

  search: (event) =>
    keyword = event.target.value
    path = '/api/game/search?keyword=' + keyword
    $.ajax path,
      type: 'GET'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log jqXHR + textStatus + errorThrown
      success: (results, textStatus, jqXHR) ->
        for data in results
          game = data['game']
          console.log game['id'] + ':' + game['name']
