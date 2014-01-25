require 'spec_helper'

describe Cms::Page::Item do
  before :each do
    @index = Cms::Page::Index.new(cms_url: "index.json")
    @index.build_content(main_text: "content")
    @page = Cms::Page::Item.new(name: "Game1", cms_url: "game1.json")
    @index.content.items << @page
    @index.save!
  end

  context "#has_parent?" do
    it "returns false if there is no parent content" do
      page = Cms::Page::Item.create(name: "Game1", cms_url: "game1.json")
      page.should_not have_parent
    end

    it "returns true if there is parent content" do
      @page.should have_parent
    end
  end

  context "#parent" do
    it "returns nil if there is no parent" do
      page = Cms::Page::Item.create(name: "Game1", cms_url: "game1.json")
      page.parent.should be_nil
    end

    it "returns the parent cms page" do
      @page.parent.should == @index
    end
  end
end