# An individual "item" listed by the index page
class Cms::Page::Item < Cms::Page
  belongs_to :parent_content, class_name: 'Cms::Content'

  # Instance methods

  def has_parent?
    respond_to?(:parent_content) && parent_content
  end

  def parent
    parent_content.try(:cms_page)
  end
end
