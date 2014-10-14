class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :cost
      t.string :location
      t.timestamp :start_time
      t.timestamp :end_time
      t.attachment :image
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end