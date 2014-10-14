json.array! @startups do |startup|
	json.name startup.name
	json.description startup.description
	json.url startup.url
end