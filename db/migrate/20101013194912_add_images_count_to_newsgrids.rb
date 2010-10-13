class AddImagesCountToNewsgrids < ActiveRecord::Migration
  def self.up
    add_column :newsgrids, :images_count, :integer, :default => 0
  end

  def self.down
    remove_column :newsgrids, :images_count
  end
end
