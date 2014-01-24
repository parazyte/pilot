class Game < ActiveRecord::Base
  belongs_to :cms_page, dependent: :destroy
  belongs_to :content
  attr_accessible :name, :url
end
