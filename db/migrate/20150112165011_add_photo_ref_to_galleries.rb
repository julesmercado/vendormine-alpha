class AddPhotoRefToGalleries < ActiveRecord::Migration
  def change
    add_reference :galleries, :photo_id, index: true
    add_reference :galleries, :supply_id, index: true
  end
end
