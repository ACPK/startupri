json.array! @startups do |startup|
	json.id startup.id
	json.name startup.name
	json.description startup.description
	json.url startup.url
end