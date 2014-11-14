class UsersController < ApplicationController
	before_action :authenticate_user!, :set_user	

	def home
		if user_signed_in?
			@user
		else
			redirect_to new_user_session_path
		end 
	end

	private

		def set_user
			@user = current_user
		end
end
