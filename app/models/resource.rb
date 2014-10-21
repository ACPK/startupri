class Resource < ActiveRecord::Base
	validates_presence_of :name, :description, :url
	belongs_to :user

end
