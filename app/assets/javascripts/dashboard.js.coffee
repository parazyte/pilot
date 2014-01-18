# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
ShowGamesIndexController = window.ShowGamesIndexController

$(document).ready ->
  if $('body.dashboard').is('*')
    new ShowGamesIndexController(
      cmsHost:       "http://localhost:5000"
      headerEl:      $('head title')
      navbarImageEl: $('body.dashboard #navbar_image')
      bodyEl:        $('body.dashboard #game_index')
      footerEl:      $('body.dashboard footer')
    ).start()
