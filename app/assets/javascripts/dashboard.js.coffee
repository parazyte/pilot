# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class ShowGamesIndexController
  constructor: (options) ->
    @cmsHost      = "http://localhost:5000"
    @title        = options.headerEl
    @navbarImage  = options.navbarImageEl
    @body         = options.bodyEl
    @footer       = options.footerEl

  start: ->
    @_renderIndex()
    @body.delegate 'a', 'click', (e) =>
      if cmsUrl = $(e.target).data("url")
        e.preventDefault()
        @_renderGame(e.target.href, cmsUrl)

  # private

  _renderIndex: ->
    $.ajax
      url: @cmsHost + "/api/v1/index.json"

      success: (data) =>
        @_setPageTitle data.page.header.text
        @_setNavbarImage data.page.header.image
        @_renderPageContent "games/index",
          games: data.page.content.games
        @_setPageFooter data.page.footer.text

      error: (e) =>
        @_renderPageContent "games/index_failed"

  _renderGame: (url, cmsUrl) ->
    $.ajax
      url: @cmsHost + cmsUrl

      success: (data) =>
        @_renderPageContent "games/show",
          game: data.page.content

      error: (e) =>
        @_renderPageContent "games/show_failed"

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
