class CmsPagesController < ApplicationController
  def index
    @cms_page = Cms::Page.find_by_cms_url("index.json")
  end

  def show
    @cms_page = Cms::Page.find(params[:id])
  end
end
