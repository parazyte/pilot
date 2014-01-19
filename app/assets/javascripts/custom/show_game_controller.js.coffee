ControllerCommon = window.ControllerCommon


class ShowGameController
  constructor: (options) ->
    include this, ControllerCommon
    @cmsHost      = options.cmsHost
    @cmsUrl       = options.cmsUrl
    @title        = options.headerEl
    @pageImage    = options.pageImageEl
    @body         = options.bodyEl

  start: ->
    @_renderGame()

  # private

  _renderGame: ->
    $.ajax
      url: @cmsHost + @cmsUrl

      success: (data) =>
        @render "games/show", data

      error: (e) =>
        @renderPageContent "games/show_failed"

window.ShowGameController = ShowGameController