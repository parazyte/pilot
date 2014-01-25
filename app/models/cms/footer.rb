class Cms::Footer < ActiveRecord::Base
  attr_accessible :text
  def self.table_name_prefix
    'cms_'
  end
end
