class CreateForeignIdIndexForEvents < ActiveRecord::Migration
  def change
  	add_index :events, :foreign_id,                :unique => true
  end
end
