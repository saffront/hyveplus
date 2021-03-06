# Smoothen out parallax scrolling for Chrome Browsers
if window.addEventListener
  window.addEventListener 'DOMMouseScroll', ->
window.onmousewheel =
document.onmousewheel = ->

$(->
  isMobile = ( /Android|webOS|iPhone|iPad|iPod|Silk|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) )

  if (isMobile == false)
    parallax = document.querySelectorAll('.parallax')
    speed = 0.65
    window.onscroll = ->
      [].slice.call(parallax).forEach (el, i) ->
        windowYOffset = window.pageYOffset - $(el).position().top
        elBackgrounPos = '50% ' + windowYOffset * speed + 'px'
        el.style.backgroundPosition = elBackgrounPos
)
