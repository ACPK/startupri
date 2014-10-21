class Startup < ActiveRecord::Base
	validates_presence_of :name
	belongs_to :user

	def self.getAngellist
		response = Net::HTTP.get_response(URI.parse(ENV["ANGELIST_API_URL"]))
		data = response.body
		parsed_response = JSON.parse(data)
		parsed_response["startups"].each do |startup|
			if Startup.where(:foreign_id => startup["id"]).blank?
				unless Startup.name == startup["name"]
					e = Startup.new(:foreign_id => startup["id"], :name => startup["name"], :description => HTML_Truncator.truncate(startup["product_desc"], 50), :url => startup["company_url"], :youtube => startup["video_url"], :facebook => startup["facebook_url"], :twitter => startup["twitter_url"], :linkedin => startup["linkedin_url"], :crunchbase => startup["crunchbase_url"], :angellist => startup["angellist_url"])
					e.save
				end
			end
		end
	end

	def self.getCrunchbase
		response = Net::HTTP.get_response(URI.parse(ENV["CRUNCHBASE_API_URL"]))
		data = response.body
		parsed_response = JSON.parse(data)
		parsed_response["data"]["items"].each do |startup|
			unless Startup.name == startup["name"]
				e = Startup.new(:name => startup["name"], :crunchbase => 'http://crunchbase.com/' + startup["path"] )
				e.save
			end
		end
	end

end