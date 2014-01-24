class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string  "text"
      t.string  "image_path"
      t.timestamps
    end
  end
end
