class AddForeignIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :foreign_id, :integer
  end
end