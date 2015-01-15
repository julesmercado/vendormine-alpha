class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :bundle_name
      t.string :pricing
      t.text   :bundle_desc
      t.integer :person_min
      t.integer :person_max
      t.integer :supplier_id

      t.timestamps
    end
    add_index :bundles, :supplier_id
  end
end
