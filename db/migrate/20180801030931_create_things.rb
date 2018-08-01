class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.references :city
      t.string :title
      t.string :image
      t.string :venue
      t.string :address
      t.string :category
      t.text :description
      t.text :what_to_bring
      t.text :what_to_wear
      t.text :where_to_park
      t.string :website
      t.float :latitude
      t.float :longitude
      t.string :slug

      t.timestamps
    end
  end
end
