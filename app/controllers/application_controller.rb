class ApplicationController < ActionController::Base

	def check_plan_id
		if user_signed_in? && params[:controller] == "books"
			unless current_user.plan.id .present?
				redirect_to(subscription_plan_books_path) if !["subscription_plan","update_subscription_plan"].include?(params[:action])
			end	
		end	
	end	
end
