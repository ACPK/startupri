require 'rubygems'
require 'json'
require 'net/http'

class MeetupController < ApplicationController

	respond_to :json
	$meetupRI = "http://api.meetup.com/2/open_events?status=upcoming&radius=25.0&category=2&and_text=False&limited_events=False&desc=False&offset=0&photo-host=public&format=json&zip=02903&page=20&sig_id=20387841&sig=8949a7bf21502f3b687359ddb69b5ab8ccb042bc"

	def getEvents
		response = Net::HTTP.get_response(URI.parse($meetupRI))
		data = response.body
		parsed_response = JSON.parse(data)
		parsed_response["results"].each do |event|
			if Event.where(:foreign_id => event["id"]).blank?
				if event["venue"].blank?
					e = Event.new(:name => event["name"], :description => event["description"], :url => event["event_url"], :start_time => DateTime.strptime(event['time'].to_s,'%Q'), :foreign_id => event["id"])
				else
					e = Event.new(:name => event["name"], :description => event["description"], :url => event["event_url"], :start_time => DateTime.strptime(event['time'].to_s,'%Q'), :foreign_id => event["id"], :location => event["venue"]["name"])
				end
				e.save
			end
		end
	end
end