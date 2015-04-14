$(document).ready ->
  $("#edit-my-account-info-link").click ->
    $("#my-account-info").addClass("hidden")
    $("#edit-my-account-info").removeClass("hidden")

    $("#my-account-password").addClass("hidden")
    $("#edit-my-account-password").removeClass("hidden")
