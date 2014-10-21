class ChangeForeignIdTypeInEvents < ActiveRecord::Migration
  def change
  	change_column :events, :foreign_id, :string
  end
end
