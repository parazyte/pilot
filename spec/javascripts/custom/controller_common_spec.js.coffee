describe "ControllerCommon", ->
  beforeEach ->
    include this, ControllerCommon
    loadFixtures('index_fixture.html')
    @html = $('#index_fixture')

  describe 'setPageTitle', ->
    it "updates the text of the @title element", ->
      @title = @html.find('title')
      @setPageTitle("My title")
      expect(@title.text()).toMatch(/My title/)

  describe 'setPageFooter', ->
    it "updates the text of the @footer element", ->
      @footer = @html.find('footer')
      @setPageFooter("My footer")
      expect(@footer.text()).toMatch(/My footer/)

    it "doesn't crash if a footer element is undefined", ->
      @footer = undefined
      @setPageFooter("My footer")
      expect(@footer).toBe(undefined)

  describe 'setPageImage', ->
    it "updates the src attr of the @pageImage element", ->
      @pageImage = @html.find('#index_image')
      @setPageImage("http://localhost/image.jpg")
      expect(@pageImage.attr("src")).toBe("http://localhost/image.jpg")
