class ApiController < ApplicationController
	def get_hash
		terminal = Terminal.find_by_hashkey(params[:hash])
		if terminal.blank?
			render :json => {error: 'Terminal not found'}		
		else
			render :json => terminal.hashkey 
		end
	end

	def set_hash
		
	end
	
	def get_user_role
		render :json => current_user.roles
	end
	
	def users
		render :json => User.fist()
	end
	
end
