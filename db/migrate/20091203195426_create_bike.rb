class CreateBike < ActiveRecord::Migration
  def self.up
    create_table :bikes do |t|
      t.column :brand, :string
      t.column :cost, :integer
    end
  end
  def self.down
    drop_table :bikes
  end
end
