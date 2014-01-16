# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class DashboardIndexController
  constructor: (el) ->
    @el = el

  start: ->
    $.ajax
      url: "http://0.0.0.0:5000/api/v1/index.json"

      success: (data) =>
        @html @view('index'
          games: data.page.content.games
        )

      error: (e) =>
        @html @view "index_failed"

  html: (html) ->
    @el.html(html)

  view: (name, locals) ->
    JST[name](locals)

$(document).ready ->
  if $('body.dashboard').is('*')
    new DashboardIndexController($('body.dashboard #javascript')).start()
