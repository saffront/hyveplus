$(document).ready ->
  if $("body").is('.pages-faq')
    $("#faq").css("color", "#495966")
    return
  if $("body").is('.pages-contact')
    $("#contact").css("color", "#495966")
    return
  if $("body").is('.pages-tnc')
    $("#tnc").css("color", "#495966")
    return
