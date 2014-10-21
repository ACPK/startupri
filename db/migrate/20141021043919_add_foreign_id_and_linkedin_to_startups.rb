class AddForeignIdAndLinkedinToStartups < ActiveRecord::Migration
  def change
  	add_column :startups, :foreign_id, :integer
  	add_column :startups, :angellist, :string
  	add_column :startups, :linkedin, :string
  	add_column :startups, :hidden, :boolean, :default => false
  end
end
