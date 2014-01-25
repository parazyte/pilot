require 'spec_helper'

describe Cms::Content do
  before :each do
    @index = Cms::Page::Index.new(cms_url: "index.json")
    @index.build_content(main_text: "content")
    @page = Cms::Page::Item.new(name: "Game1", cms_url: "game1.json")
    @index.content.items << @page
    @index.save!
    @content = @index.content
  end

  it "has a main_text attribute" do
    @content.should respond_to(:main_text)
  end

  it "has a cms_page" do
    @content.cms_page.should == @index
  end

  it "has an array of items" do
    @content.items.should == [@page]
  end
end
