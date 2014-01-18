ControllerCommon = window.ControllerCommon
ShowGameController = window.ShowGameController

class ShowGamesIndexController
  constructor: (options) ->
    include this, ControllerCommon
    @cmsHost      = options.cmsHost
    @title        = options.headerEl
    @navbarImage  = options.navbarImageEl
    @body         = options.bodyEl
    @footer       = options.footerEl

  start: ->
    @_renderIndex()
    @body.delegate 'a', 'click', (e) =>
      if cmsUrl = $(e.target).data("url")
        e.preventDefault()
        window.location = e.target.href + '?cms_url=' + cmsUrl

  # private

  _renderIndex: ->
    $.ajax
      url: @cmsHost + "/api/v1/index.json"

      success: (data) =>
        @setPageTitle data.page.header.text
        @setNavbarImage data.page.header.image
        @renderPageContent "games/index",
          games: data.page.content.games
        @setPageFooter data.page.footer.text

      error: (e) =>
        @renderPageContent "games/index_failed"

window.ShowGamesIndexController = ShowGamesIndexController