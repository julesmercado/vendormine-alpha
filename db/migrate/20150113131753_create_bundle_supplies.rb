class CreateBundleSupplies < ActiveRecord::Migration
  def change
    create_table :bundle_supplies do |t|
      t.integer :supply_id

      t.timestamps
    end
    add_index :bundle_supplies, :supply_id
  end
end
