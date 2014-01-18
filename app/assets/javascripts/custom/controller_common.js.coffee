# Mixin
class ControllerCommon
  setPageTitle: (title) ->
    @title.text(title)

  setNavbarImage: (src) ->
    @navbarImage.attr("src", src)

  renderPageContent: (template, locals) ->
    @body.html JST[template](locals)

  setPageFooter: (title) ->
    @footer.text(title)

window.ControllerCommon = ControllerCommon
