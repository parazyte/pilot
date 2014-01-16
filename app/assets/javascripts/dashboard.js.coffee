# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class ShowGamesIndexController
  constructor: (options) ->
    @title        = options.headerEl
    @navbarImage  = options.navbarImageEl
    @body         = options.bodyEl
    @footer       = options.footerEl

  start: ->
    $.ajax
      url: "http://0.0.0.0:5000/api/v1/index.json"

      success: (data) =>
        @_setPageTitle data.page.header.text
        @_setNavbarImage data.page.header.image
        @_renderPageContent "index",
          games: data.page.content.games
        @_setPageFooter data.page.footer.text

      error: (e) =>
        @_renderPageContent "index_failed"

  # private

  _setPageTitle: (title) ->
    @title.text(title)

  _setNavbarImage: (src) ->
    @navbarImage.attr("src", src)

  _renderPageContent: (template, locals) ->
    @body.html JST[template](locals)

  _setPageFooter: (title) ->
    @footer.text(title)

$(document).ready ->
  if $('body.dashboard').is('*')
    new ShowGamesIndexController(
      headerEl:      $('head title')
      navbarImageEl: $('body.dashboard #navbar_image')
      bodyEl:        $('body.dashboard #game_index')
      footerEl:      $('body.dashboard footer')
    ).start()
