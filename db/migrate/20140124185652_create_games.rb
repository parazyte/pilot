class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  "name"
      t.string  "url"
      t.integer "cms_page_id"
      t.integer "content_id"
      t.timestamps
    end
  end
end
