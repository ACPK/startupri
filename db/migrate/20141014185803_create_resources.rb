class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.string :url
      t.string :youtube
      t.string :facebook
      t.string :twitter
      t.integer :user_id
      t.integer :resource_category

      t.timestamps
    end
  end
end
