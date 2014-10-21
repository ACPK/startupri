class Event < ActiveRecord::Base
	validates_presence_of :name, :url
	belongs_to :user

	def self.getMeetups
		response = Net::HTTP.get_response(URI.parse(ENV["MEETUP_API_URL"]))
		data = response.body
		parsed_response = JSON.parse(data)
		parsed_response["results"].each do |event|
			if Event.where(:foreign_id => event["id"]).blank?
				if event["venue"].blank?
				e = Event.new(:name => event["name"], :description => HTML_Truncator.truncate(event["description"], 50), :url => event["event_url"], :start_time => DateTime.strptime(event['time'].to_s,'%Q'), :foreign_id => event["id"])
				else
				e = Event.new(:name => event["name"], :description => HTML_Truncator.truncate(event["description"], 50), :url => event["event_url"], :start_time => DateTime.strptime(event['time'].to_s,'%Q'), :foreign_id => event["id"], :location => event["venue"]["name"])
				end
				e.save
			end
		end
	end

	def self.getEventbrites
		response = Net::HTTP.get_response(URI.parse(ENV["EVENTBRITE_API_URL"]))
		data = response.body
		parsed_response = JSON.parse(data)
		parsed_response["events"].each do |event|
			if Event.where(:foreign_id => event["id"]).blank?
				e = Event.new(:name => event["name"]["text"], :description => HTML_Truncator.truncate(event["description"]["text"], 50), :url => event["url"], :start_time => event["start"]["local"], :end_time => event["end"]["local"], :foreign_id => event["id"], :location => event["venue"]["name"])
				e.save
			end
		end
	end
	
end