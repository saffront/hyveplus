#Show edit-user-info/edit-hyve-info container and hide user-info/hyve-info container
$(document).ready ->
  $("#edit-my-account-info-btn").click ->
    $("#my-user-info").addClass("hidden")
    $("#edit-my-user-info").removeClass("hidden")

  $(".edit-my-hyve-info-btn").click (e) ->
    array = (e.target.id).split("-") #e.g. e.target.id =  "edit-my-hyve-70-info-btn"

    array.pop()
    show = array.join("-") #e.g "edit-my-hyve-70-info"

    array.shift()
    hide = array.join("-") #e.g "my-hyve-70-info"
    
    $("#"+show).removeClass("hidden")
    $("#"+hide).addClass("hidden")
