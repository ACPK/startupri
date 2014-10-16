json.array! @events do |event|
	json.id event.id
	json.name event.name
	json.description event.description
	json.url event.url
	json.start_time event.start_time
	json.end_time event.end_time
	json.location event.location
	json.cost event.cost
end