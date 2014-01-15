# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  if $('body.dashboard').is('*')
    $.ajax
      url: "http://0.0.0.0:5000/api/v1/index.json"
      success: (data) ->
        $('body.dashboard .container .content').html(data.page.header.text)
      error: (e) ->
        $('body.dashboard .container .content').html(JST["index_failed"]())

