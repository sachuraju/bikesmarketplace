class CreateBike < ActiveRecord::Migration
  def self.up
    create_table :bikes do |t|
      t.column :bike_id, :string
      t.column :brand, :string
      t.column :cost, :integer
      t.column :brand, :string
    end
  end
  def self.down
    drop_table :bikes
  end
end
