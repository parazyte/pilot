class Cms::Header < ActiveRecord::Base
  attr_accessible :text, :image_path
  def self.table_name_prefix
    'cms_'
  end
end
