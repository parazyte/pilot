require 'spec_helper'

describe Cms::Page::Index do
  before :each do
    @index=Cms::Page::Index.new(cms_url: "index.json")
    @index.build_header(text: "header text", image_path: "http://localhost:5000/images/header.jpg")
    @index.build_content(main_text: "content")
    @index.build_footer(text: "footer text")

    @item1 = Cms::Page::Item.new(name: "Game1", cms_url: "game1.json")
    @item1.build_header(text: "header text game 1", image_path: "http://localhost:5000/images/game1.jpg")
    @item1.build_content(main_text: "gamesgamesgames")

    @item2 = Cms::Page::Item.new(name: "Game2", cms_url: "game2.json")
    @item2.build_header(text: "header text game 2", image_path: "http://localhost:5000/images/game2.jpg")
    @item2.build_content(main_text: "gangnams")

    @index.content.items << @item1
    @index.content.items << @item2

    @index.save!
  end

  context "callbacks" do
    it "deletes everything in the Cms:: namespace in cascade when destroying the index page" do
      Cms::Page.count.should_not be_zero
      Cms::Footer.count.should_not be_zero
      Cms::Header.count.should_not be_zero
      Cms::Content.count.should_not be_zero
      @index.destroy
      Cms::Page.count.should be_zero
      Cms::Footer.count.should be_zero
      Cms::Header.count.should be_zero
      Cms::Content.count.should be_zero
    end
  end
end