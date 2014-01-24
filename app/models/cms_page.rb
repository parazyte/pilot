class CmsPage < ActiveRecord::Base
  belongs_to :header, dependent: :destroy
  belongs_to :content, dependent: :destroy
  belongs_to :footer, dependent: :destroy
  attr_accessible :cms_url
end
