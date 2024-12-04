class AddImageableToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_reference :photos, :imageable, polymorphic: true, index: true
  end
end
