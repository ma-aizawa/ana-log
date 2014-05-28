class @IndexPlay
  constructor: ->
    $('.submit-btn').on 'click', @login

  login: (event) ->
    $target = $(event.target)
    classes = $target.prop('id')
    $login_type = $('#login-type')

    if classes.match(/login-btn/)
      $login_type.val('login')
    else if classes.match(/singup-btn/)
      $login_type.val('signup')
    true

