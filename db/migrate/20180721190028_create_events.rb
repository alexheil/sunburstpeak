class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user
      t.references :city
      t.integer :event_type, default: 0
      t.string :title
      t.string :image_data
      t.string :venue
      t.string :address
      t.string :street_number
      t.string :street_name
      t.string :suite_number
      t.string :city_name
      t.string :state_name
      t.string :country_name
      t.string :zip_code
      t.string :category
      t.text :description
      t.text :what_to_bring
      t.text :what_to_wear
      t.text :where_to_park
      t.integer :price
      t.string :website
      t.string :start_hour
      t.string :end_hour
      t.string :start_minute
      t.string :end_minute
      t.string :start_am_pm
      t.string :end_am_pm
      t.string :month
      t.string :day
      t.string :year
      t.datetime :start_time
      t.datetime :end_time
      t.float :latitude
      t.float :longitude
      t.boolean :sponsored, default: false
      t.string :slug

      t.timestamps
    end
  end
end
