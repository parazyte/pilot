# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

page=CmsPage.new(cms_url: "index.json")
page.build_header(text: "header text", image_path: "http://localhost:5000/images/header.jpg")
page.build_content(main_text: "content")
page.build_footer(text: "footer text")

game1 = Game.new(name: "Game1", url: "game1.json")
game1.build_cms_page(cms_url: "game1.json")
game1.cms_page.build_header(text: "header text game 1", image_path: "http://localhost:5000/images/game1.jpg")
game1.cms_page.build_content(main_text: "gamesgamesgames")

game2 = Game.new(name: "Game2", url: "game2.json")
game2.build_cms_page(cms_url: "game2.json")
game2.cms_page.build_header(text: "header text game 2", image_path: "http://localhost:5000/images/game2.jpg")
game2.cms_page.build_content(main_text: "gangnams")

page.content.games << game1
page.content.games << game2

page.save!
