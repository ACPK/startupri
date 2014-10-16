ActiveAdmin.register Startup do

	controller do
		# def find_resource
		# 	scoped_collection.friendly.find(params[:id])
		# end
		def permitted_params
			params.permit startup: [:name, :description, :logo, :url, :youtube, :facebook, :twitter, :crunchbase, :user_id ]
		end
	end

end