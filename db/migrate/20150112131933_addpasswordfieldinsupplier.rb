class Addpasswordfieldinsupplier < ActiveRecord::Migration
  def change
  	add_column :suppliers, :password_digest, :string
  	add_column :suppliers, :avatar, :string
  	add_reference :supplies, :supplier, index: true
  end
end
