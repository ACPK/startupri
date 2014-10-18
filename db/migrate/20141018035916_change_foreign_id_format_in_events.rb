class ChangeForeignIdFormatInEvents < ActiveRecord::Migration
	def self.up
		change_column :events, :foreign_id, :numeric
	end
	def self.down
		change_column :events, :foreign_id, :integer
	end
end