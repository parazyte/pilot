class GamesController < ApplicationController
  def show
    @cms_url = params[:cms_url]
  end
end
