describe "ControllerCommon", ->
  beforeEach ->
    include this, ControllerCommon

  describe 'setPageTitle', ->
    it "updates the text of the @title element", ->
      @title = $('head title')
      @setPageTitle("My title")
      expect(@title.text()).toMatch(/My title/)

  describe 'setPageFooter', ->
    it "updates the text of the @footer element", ->
      @footer = $('head title')
      @setPageFooter("My footer")
      expect(@footer.text()).toMatch(/My footer/)

    it "doesn't crash if a footer element is undefined", ->
      @footer = undefined
      @setPageFooter("My footer")
      expect(@footer).toBe(undefined)

  describe 'setPageImage', ->
    it "updates the src attr of the @pageImage element", ->
      @pageImage = $('head title')
      @setPageImage("http://localhost/image.jpg")
      expect(@pageImage.attr("src")).toBe("http://localhost/image.jpg")
