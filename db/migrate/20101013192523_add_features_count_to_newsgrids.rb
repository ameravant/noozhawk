class AddFeaturesCountToNewsgrids < ActiveRecord::Migration
  def self.up
    add_column :newsgrids, :features_count, :integer, :default => 0
  end

  def self.down
    remove_column :newsgrids, :features_count
  end
end
