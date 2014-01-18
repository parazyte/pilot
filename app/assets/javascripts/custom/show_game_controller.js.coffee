ControllerCommon = window.ControllerCommon

class ShowGameController
  constructor: (options) ->
    include this, ControllerCommon
    @cmsHost      = options.cmsHost
    @cmsUrl       = options.cmsUrl
    @body         = options.bodyEl

  start: ->
    @_renderGame()

  _renderGame: ->
    $.ajax
      url: @cmsHost + @cmsUrl

      success: (data) =>
        @renderPageContent "games/show",
          game: data.page.content

      error: (e) =>
        @renderPageContent "games/show_failed"

window.ShowGameController = ShowGameController