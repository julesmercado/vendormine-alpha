class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :supply_name
      t.text   :supply_desc
      t.decimal :supply_price

      t.timestamps
    end
  end
end
