# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

index=Cms::Page::Index.new(cms_url: "index.json")
index.build_header(text: "header text", image_path: "http://localhost:5000/images/header.jpg")
index.build_content(main_text: "content")
index.build_footer(text: "footer text")

item1 = Cms::Page::Item.new(name: "Game1", cms_url: "game1.json")
item1.build_header(text: "header text game 1", image_path: "http://localhost:5000/images/game1.jpg")
item1.build_content(main_text: "gamesgamesgames")

item2 = Cms::Page::Item.new(name: "Game2", cms_url: "game2.json")
item2.build_header(text: "header text game 2", image_path: "http://localhost:5000/images/game2.jpg")
item2.build_content(main_text: "gangnams")

index.content.items << item1
index.content.items << item2

index.save!
