class CreateContents < ActiveRecord::Migration
  def change
    create_table :cms_contents do |t|
      t.string  "main_text"
      t.timestamps
    end
  end
end
