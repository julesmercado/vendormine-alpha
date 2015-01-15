class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.string :name

      t.timestamps
    end
  end
end
