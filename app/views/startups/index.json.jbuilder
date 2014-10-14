json.array!(@startups) do |startup|
  json.extract! startup, :id, :name, :description, :logo, :url, :youtube, :facebook, :twitter, :crunchbase, :user_id
  json.url startup_url(startup, format: :json)
end
