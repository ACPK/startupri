require 'rubygems'
require 'json'
require 'net/http'

class MeetupController < ApplicationController

	respond_to :json
	$meetupRI = ENV["MEETUP_API_URL"]

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