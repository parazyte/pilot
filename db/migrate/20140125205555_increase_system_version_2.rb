class IncreaseSystemVersion2 < ActiveRecord::Migration
  def up
    SystemVersion.create(major: 0, minor: 2)
  end

  def down
  end
end
