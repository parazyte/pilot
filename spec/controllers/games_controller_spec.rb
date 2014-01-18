require 'spec_helper'

describe GamesController do
  context "GET show" do
    it "routes successfully" do
      get :show
      response.should be_successful
    end

    it "renders the show template" do
      get :show
      response.should render_template("show")
    end
  end

end
