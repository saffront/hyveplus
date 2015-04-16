$(document).ready ->
  $(".glyphicon.glyphicon-chevron-down").click (e) ->
    #Both are equivalent
    #$("#" + e.target.id).toggleClass("glyphicon-up")
    $(this).toggleClass("glyphicon-up")
