$(document).ready ->
  $("#edit-my-account-info-btn").click ->
    $("#my-user-info").addClass("hidden")
    $("#edit-my-user-info").removeClass("hidden")

  $(".edit-my-hyve-info-btn").click (e) ->
    array = (e.target.id).split("-")
    #Remove last element from array i.e. "btn"
    array.pop()
    show = array.join("-")
    #Remove 1st element from array i.e. "edit"
    array.shift()
    hide = array.join("-")

    $("#"+show).removeClass("hidden")
    $("#"+hide).addClass("hidden")
