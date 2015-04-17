$(document).ready ->
  $("#edit-my-account-info-btn").click ->
    $("#my-user-info").addClass("hidden")
    $("#edit-my-user-info").removeClass("hidden")

  $(".edit-my-hyve-info-btn").click (e) ->
    #e.g. e.target.id =  "edit-my-hyve-70-info-btn"
    array = (e.target.id).split("-")

    array.pop()
    show = array.join("-") #e.g "edit-my-hyve-70-info"

    array.shift()
    hide = array.join("-") #e.g "my-hyve-70-info"
    
    $("#"+show).removeClass("hidden")
    $("#"+hide).addClass("hidden")
