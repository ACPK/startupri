class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.text :description
      t.attachment :logo
      t.string :url
      t.string :youtube
      t.string :facebook
      t.string :twitter
      t.string :crunchbase
      t.integer :user_id

      t.timestamps
    end
  end
end
