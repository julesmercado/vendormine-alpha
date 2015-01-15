class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :supplier_address
      t.string :supplier_email
      t.string :supplier_contact_no
      t.text   :supplier_desc

      t.timestamps
    end
  end
end
