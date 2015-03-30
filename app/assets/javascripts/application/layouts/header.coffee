$(document).ready ->
  $("#about").click (e) ->
    e.preventDefault()
    #Make secondary navbar appear
    $("#secondary").removeClass("hide")
    #Remove blue-border-btm from rest and add blue-border-btm to about
    $("#home-link").removeClass("blue-border-btm")
    $("#order-link").removeClass("blue-border-btm")
    $("#login-link").removeClass("blue-border-btm")
    #Shameful-see header.scss
    $("#about-link").addClass("blue-border-btm-hack")
