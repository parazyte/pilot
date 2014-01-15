require 'spec_helper'

describe DashboardController do
  context "GET index" do
    it "should be root" do
      { get: "/" }.should route_to(controller: 'dashboard', action: 'index')
    end

    it "routes successfully" do
      get :index
      response.should be_successful
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end
end
