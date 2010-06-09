class AddMenusCountToNewsgrids < ActiveRecord::Migration
  def self.up
    add_column :newsgrids, :menus_count, :integer, :default => 0
  end

  def self.down
    remove_column :newsgrids, :menus_count
  end
end
