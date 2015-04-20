$(document).ready ->
  $(".glyphicon.glyphicon-chevron-down").click (e) ->
    #Both are equivalent
    #$("#" + e.target.id).toggleClass("glyphicon-up")
    $(this).toggleClass("glyphicon-up")
    
    array = (e.target.id).split("-")
    array.pop()
    image_array = array.push("image")
    image = array.join("-") #e.g. "my-hyve-70-image"

    array.pop()
    header_array = array.push("header")
    header = array.join("-") #e.g. "my-hyve-70-header"

    $("#"+image).toggleClass("hidden")
    $("#"+header).toggleClass("hidden")
