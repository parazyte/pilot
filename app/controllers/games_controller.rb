class GamesController < ApplicationController
  def show
    @cms_page = CmsPage.find_by_cms_url(params[:cms_url])
  end
end
