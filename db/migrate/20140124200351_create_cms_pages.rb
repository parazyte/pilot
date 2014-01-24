class CreateCmsPages < ActiveRecord::Migration
  def change
    create_table :cms_pages do |t|
      t.string  "cms_url"
      t.integer "header_id"
      t.integer "content_id"
      t.integer "footer_id"
      t.timestamps
    end
  end
end
