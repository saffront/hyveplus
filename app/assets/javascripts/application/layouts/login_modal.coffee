$(document).ready ->
  $("#login-modal-trigger").leanModal({
    top: 150,
    overlay: 0.5,
    closeButton: ".modal_close"
  })

  $(".user-forgot-password-link").click (e) ->
    e.preventDefault()
    $("#user-forgot-password").removeClass("hidden")
    $("#user-sign-up").addClass("hidden")
    $("#user-login").addClass("hidden")
    $(".header_title").text("Forgot Password")

  $(".user-signup-link").click (e) ->
    e.preventDefault()
    $("#user-signup").removeClass("hidden")
    $("#user-forgot-password").addClass("hidden")
    $("#user-login").addClass("hidden")
    $(".header_title").text("Register")

  $(".user-login-link").click (e) ->
    e.preventDefault()
    $("#user-login").removeClass("hidden")
    $("#user-signup").addClass("hidden")
    $("#user-forgot-password").addClass("hidden")
    $(".header_title").text("Login")

