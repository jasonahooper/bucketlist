class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :name
      t.string :image_url
      t.integer :priority
      t.string :where
      t.float :latitude
      t.float :longitude
      t.integer :destination_id, :default => 2

      t.timestamps
    end
  end
end
