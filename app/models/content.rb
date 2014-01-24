class Content < ActiveRecord::Base
  has_many :games, dependent: :destroy
  attr_accessible :main_text
end
