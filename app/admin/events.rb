ActiveAdmin.register Event do

	controller do
		# def find_resource
		# 	scoped_collection.friendly.find(params[:id])
		# end
		def permitted_params
			params.permit event: [:name, :description, :cost, :location, :start_time, :end_time, :image, :url, :user_id, :foreign_id, :hidden ]
		end
	end

end