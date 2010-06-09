class AddPermalinkToNewsgrids < ActiveRecord::Migration
  def self.up
    add_column :newsgrids, :permalink, :string
  end

  def self.down
    remove_column :newsgrids, :permalink
  end
end
