class CreateFooters < ActiveRecord::Migration
  def change
    create_table :footers do |t|
      t.string  "text"
      t.timestamps
    end
  end
end
