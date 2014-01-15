describe "dashboard", ->
  describe 'templates', ->
    it "has a template to render when xhr request goes wrong", ->
      expect(JST["index_failed"]()).toMatch(/Getting index from CMS server failed!/);