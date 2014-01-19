describe "ShowGamesIndexController", ->
  describe 'templates', ->
    it "has a template to render when xhr request goes wrong", ->
      expect(JST["games/show_failed"]()).toMatch(/Error: Getting game from CMS server failed!/);

    it "has a template to render when xhr request is successful", ->
      data = {"page":{"header":{"text":"Gamers heaven","image":"http://localhost:5000/images/header.jpg"},"content":{"main_text":"Welcome to this gaming site, as you see it is very interesting and full of content","games":[{"id":1,"name":"Superheroes 1","url":"/api/v1/games/1.json"},{"id":2,"name":"Rally 2.0","url":"/api/v1/games/2.json"},{"id":3,"name":"Birds birds v2014","url":"/api/v1/games/3.json"}]},"footer":{"text":"2014. Heyho"}}}
      expect(JST["games/index"](data: data)).toMatch(/Gamers heaven/);
