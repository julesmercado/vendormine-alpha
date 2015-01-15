class Addindexes < ActiveRecord::Migration
  def change
  	add_column :bundle_supplies, :bundle_id, :integer
  	add_index :bundle_supplies, :bundle_id
  end
end
