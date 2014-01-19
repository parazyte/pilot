describe "ShowGameController", ->
  describe 'templates', ->
    it "has a template to render when xhr request goes wrong", ->
      expect(JST["games/index_failed"]()).toMatch(/Getting index from CMS server failed!/);

    it "has a template to render when xhr request is successful", ->
      data = {"page":{"header":{"id":1,"text":"Superheroes 1","image":"http://localhost:5000/images/game1.jpg"},"content":{"main_text":"Superheroes is an amazing fight game"}}}
      expect(JST["games/show"](data: data)).toMatch(/Superheroes is an amazing fight game/);
