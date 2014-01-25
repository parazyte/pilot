class Cms::Content < ActiveRecord::Base
  has_one :cms_page, class_name: 'Cms::Page', foreign_key: :content_id
  has_many :items, class_name: 'Cms::Page::Item', dependent: :destroy, foreign_key: :parent_content_id
  attr_accessible :main_text

  def self.table_name_prefix
    'cms_'
  end
end
