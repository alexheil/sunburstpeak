class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.references :user
      t.references :event

      t.timestamps
    end
  end
end
