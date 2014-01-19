# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
ShowGameController = window.ShowGameController

$(document).ready ->
  if $('body.games.show').is('*')
    new ShowGameController(
      cmsHost:       "http://localhost:5000"
      headerEl:      $('head title')
      pageImageEl:   $('#game_image')
      bodyEl:        $('#game_show')
      cmsUrl:        $('.url').text().trim()
    ).start()
