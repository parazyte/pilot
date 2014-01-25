class CreateSystemVersions < ActiveRecord::Migration
  def change
    create_table :system_versions do |t|
      t.integer :major
      t.integer :minor
      t.timestamps
    end
    SystemVersion.create(major: 0, minor: 1)
  end
end
