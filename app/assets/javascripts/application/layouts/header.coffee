$(document).ready ->
  $("#about").click (e) ->
    e.preventDefault()
    #Make secondary navbar appear
    $("#secondary").removeClass("hide")
    #Remove blue-border-btm from rest and add blue-border-btm to about
    $("#home-link-border").removeClass("blue-border-btm")
    $("#order-link-border").removeClass("blue-border-btm")
    $("#login-link-border").removeClass("blue-border-btm")
    #Shameful-see header.scss
    $("#about-link-border").addClass("blue-border-btm-hack")
