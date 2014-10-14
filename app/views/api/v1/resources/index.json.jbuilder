json.array! @resources do |resource|
	json.name resource.name
	json.description resource.description
	json.url resource.url
end