require 'spec_helper'

describe CmsPagesController do
  before :each do
    @index = Cms::Page::Index.create(cms_url: "index.json")
    @item  = Cms::Page::Item.create(name: "Game1", cms_url: "game1.json")
  end

  context "GET index" do
    it "should be root" do
      { get: "/" }.should route_to(controller: 'cms_pages', action: 'index')
    end

    it "routes successfully" do
      get :index
      response.should be_successful
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end

    it "assigns the index as @cms_page" do
      get :index
      assigns(:cms_page).should eq(@index)
    end
  end

  context "GET show" do
    it "routes successfully" do
      get :show, {id: @item.id}
      response.should be_successful
    end

    it "renders the show template" do
      get :show, {id: @item.id}
      response.should render_template("show")
    end

    it "assigns the item as @cms_page" do
      get :show, {id: @item.id}
      assigns(:cms_page).should eq(@item)
    end
  end
end
