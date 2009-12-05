class RemoveIdColumnFromBike < ActiveRecord::Migration
  def self.up
    remove_column :bikes, :bike_id
  end

  def self.down
    add_column :bikes, :bike_id
  end
end
