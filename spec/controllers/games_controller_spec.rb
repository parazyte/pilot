require 'spec_helper'

describe GamesController do
  context "GET show" do
    it "routes successfully" do
      get :show, id: 1
      response.should be_successful
    end

    it "renders the index template" do
      get :show, id: 1
      response.should render_template("show")
    end
  end
end
