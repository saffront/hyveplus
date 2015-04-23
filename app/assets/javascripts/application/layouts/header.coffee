#Header blue-border-btm when at particular page
$(document).ready ->
  $("#about").click ->
    #Make secondary navbar appear
    $("#secondary").removeClass("hidden")
    #Remove blue-border-btm from rest and add blue-border-btm to about
    $("#home-link-border").removeClass("blue-border-btm")
    $("#kickstarter-link-border").removeClass("blue-border-btm")
    $("#login-link-border").removeClass("blue-border-btm")
    #Shameful-see header.scss
    $("#about-link-border").addClass("blue-border-btm-hack")

  #Show secondary navbar when on pages#company, page#product or pages#press
  if $("body").is('.pages-company')
    $("#secondary").removeClass("hidden")
    return
  if $("body").is('.pages-product')
    $("#secondary").removeClass("hidden")
    return
  if $("body").is('.pages-press')
    $("#secondary").removeClass("hidden")
    return
