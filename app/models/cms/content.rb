class Cms::Content < ActiveRecord::Base
  include Cms
  has_one :cms_page, class_name: 'Cms::Page', foreign_key: :content_id
  has_many :items, class_name: 'Cms::Page::Item', dependent: :destroy, foreign_key: :parent_content_id
  attr_accessible :main_text
end
