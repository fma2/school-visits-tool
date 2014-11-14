class WelcomeController < ApplicationController
  def signin
		if user_signed_in?
			redirect_to home_path
		end  	
  end
end
