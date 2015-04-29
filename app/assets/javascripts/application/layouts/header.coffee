#Header blue-border-btm when at particular page
$(document).ready ->
  $("#about").click ->
    #Remove blue-border-btm from rest and add blue-border-btm to about
    $("#home-link-border").removeClass("blue-border-btm")
    $("#kickstarter-link-border").removeClass("blue-border-btm")
    $("#login-link-border").removeClass("blue-border-btm")
    #Shameful-see header.scss
    $("#about-link-border").addClass("blue-border-btm-hack")
