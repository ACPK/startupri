require 'rubygems'
require 'json'
require 'net/http'

class EventbriteController < ApplicationController
	respond_to :json
	$eventbriteRI = "https://www.eventbriteapi.com/v3/events/search/?venue.city=providence&token=3BS25F7EIU2IIB4YWQWF"

	def getEvents
		response = Net::HTTP.get_response(URI.parse($eventbriteRI))
		data = response.body
		parsed_response = JSON.parse(data)
		parsed_response["events"].each do |event|
			# if Event.where(:foreign_id => event["id"]).blank?
				e = Event.new(:name => event["name"]["text"], :description => event["description"]["text"], :url => event["url"], :start_time => event["start"]["local"], :end_time => event["end"]["local"], :foreign_id => event["id"], :location => event["venue"]["name"])
				e.save
			# end
		end
	end
end