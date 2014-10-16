ActiveAdmin.register User do

	controller do
		# def find_resource
		# 	scoped_collection.friendly.find(params[:id])
		# end
		def permitted_params
        	params.permit user: [:email, :password, :password_confirmation, :name, :image, :confirmation_token, :unconfirmed_email, :confirmed_at]
      end
	end

end