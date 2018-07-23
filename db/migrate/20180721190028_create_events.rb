class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user
      t.references :city
      t.integer :event_type, default: 0
      t.string :title
      t.string :venue
      t.string :address
      t.string :start_hour
      t.string :end_hour
      t.string :month
      t.string :day
      t.string :year
      t.datetime :start_time
      t.datetime :end_time
      t.float :latitude
      t.float :longitude
      t.string :slug

      t.timestamps
    end
  end
end
