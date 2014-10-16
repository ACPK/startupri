ActiveAdmin.register Resource do

	controller do
		# def find_resource
		# 	scoped_collection.friendly.find(params[:id])
		# end
		def permitted_params
			params.permit resource: [:name, :description, :image, :url, :youtube, :facebook, :twitter, :user_id ]
		end
	end

end