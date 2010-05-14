class CreateNewsgrids < ActiveRecord::Migration
  def self.up
    create_table :newsgrids do |t|
      t.string :title
      t.integer :time_frame, :default => 72
      t.timestamps
    end
  end

  def self.down
    drop_table :newsgrids
  end
end
