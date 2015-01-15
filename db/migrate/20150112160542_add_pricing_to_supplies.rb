class AddPricingToSupplies < ActiveRecord::Migration
  def change
    add_column :supplies, :pricing, :string
  end
end
