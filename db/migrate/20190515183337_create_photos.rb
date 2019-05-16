class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image
      t.string :location
      t.string :description
      t.integer :memory_id

      t.timestamps
    end
  end
end
