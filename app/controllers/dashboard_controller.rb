class DashboardController < ApplicationController
  def index
    @cms_page = CmsPage.find_by_cms_url("index.json")
  end
end
