class Dropgame < ActiveRecord::Migration
  def up
    drop_table :games
  end

  def down
  end
end
