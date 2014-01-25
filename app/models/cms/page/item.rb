# An individual "item" listed by the index page
class Cms::Page::Item < Cms::Page
  belongs_to :parent_content, class_name: 'Cms::Content'
end
