# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
ShowGameController = window.ShowGameController

$(document).ready ->
  if $('body.games.show').is('*')
    new ShowGameController(
      cmsHost:       "http://localhost:5000"
      cmsUrl:        $('.url').text().trim()
      navbarImageEl: $('#navbar_image')
      headerEl:      $('head title')
      bodyEl:        $('#game_show')
    ).start()
