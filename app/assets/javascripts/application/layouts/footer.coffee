#Footer font color when in particular page
$(document).ready ->
  if $("body").is('.pages-faq')
    $("#faq").css("color", "#495966")

  if $("body").is('.pages-blog')
    $("#blog").css("color", "#495966")

  if $("body").is('.pages-contact')
    $("#contact").css("color", "#495966")

  if $("body").is('.pages-tnc')
    $("#tnc").css("color", "#495966")
