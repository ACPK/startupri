class Event < ActiveRecord::Base
	validates_presence_of :name, :description, :cost, :location, :url, :start_time
	belongs_to :user
end