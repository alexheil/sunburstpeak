class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :user
      t.string :title
      t.string :content
      t.datetime :start_time
      t.datetime :end_time
      t.string :slug

      t.timestamps
    end
  end
end
