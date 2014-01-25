class Cms::Footer < ActiveRecord::Base
  include Cms
  attr_accessible :text
end
