class Cms::Header < ActiveRecord::Base
  include Cms
  attr_accessible :text, :image_path
end
