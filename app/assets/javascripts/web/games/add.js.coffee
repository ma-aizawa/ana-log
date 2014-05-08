class @AddPlay
  constructor: ->
    # $('#search-key').on 'keydown', @search
    # $('option').on 'click', @set_game_id

  search: (event) ->
    keyword = event.target.value

    path = '/api/game/search?keyword=' + keyword
    # $('#search-key').off 'keydown', @search
    # search_on = => $('#search-key').on 'keydown', @search
    # setTimeout search_on, 500

    $.ajax path,
      type: 'GET'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log jqXHR + textStatus + errorThrown
      success: (results, textStatus, jqXHR) ->
        game_list = for data in results
          game = data['game']
        return if game_list.length == 0
        $('#game-list').empty()
        for game in game_list
          console.log game['id'] + game['name']

          $option = $('<option/>').data('id', game['id'])
          $option = $option.val(game['id'] + ':' + game['name'])
          $('#game-list').append($option)


  set_game_id: (event) ->
    game_id = $(event.target).val()
    $('#play_game_id').val(game_id)

