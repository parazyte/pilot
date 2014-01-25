# Abstract Page, STI model
class Cms::Page < ActiveRecord::Base
  include Cms
  belongs_to :header,  class_name: 'Cms::Header',  dependent: :destroy
  belongs_to :content, class_name: 'Cms::Content', dependent: :destroy
  belongs_to :footer,  class_name: 'Cms::Footer',  dependent: :destroy
  attr_accessible :name, :cms_url

  def has_parent?
    false
  end
end
