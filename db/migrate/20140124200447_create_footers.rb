class CreateFooters < ActiveRecord::Migration
  def change
    create_table :cms_footers do |t|
      t.string  "text"
      t.timestamps
    end
  end
end
