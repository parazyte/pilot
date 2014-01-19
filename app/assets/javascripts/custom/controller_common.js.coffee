# Mixin
class ControllerCommon
  render: (template, data) ->
    @setPageTitle data.page.header.text
    @setPageImage data.page.header.image
    @renderPageContent template,
      data: data
    @setPageFooter data.page.footer?.text

  setPageTitle: (title) ->
    @title.text(title)

  setPageImage: (src) ->
    @pageImage.attr("src", src)

  renderPageContent: (template, locals) ->
    @body.html JST[template](locals)

  setPageFooter: (title) ->
    @footer?.text(title)

window.ControllerCommon = ControllerCommon
