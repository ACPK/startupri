class ChangeDataTypeForForeignIdInEvents < ActiveRecord::Migration
  def self.up
		change_column :events, :foreign_id, :string
	end
	def self.down
		change_column :events, :foreign_id, :numeric
	end
end
