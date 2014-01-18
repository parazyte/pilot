ControllerCommon = window.ControllerCommon

class ShowGameController
  constructor: (options) ->
    include this, ControllerCommon
    @cmsHost      = options.cmsHost
    @cmsUrl       = options.cmsUrl
    @title        = options.headerEl
    @navbarImage  = options.navbarImageEl
    @body         = options.bodyEl

  start: ->
    @_renderGame()

  _renderGame: ->
    $.ajax
      url: @cmsHost + @cmsUrl

      success: (data) =>
        @setPageTitle data.page.header.text
        @setNavbarImage data.page.header.image
        @renderPageContent "games/show",
          game: data.page.content

      error: (e) =>
        @renderPageContent "games/show_failed"

window.ShowGameController = ShowGameController