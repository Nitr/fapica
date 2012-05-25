class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:user_update]
  respond_to :json
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
	
<<<<<<< HEAD
=======
	def user_update
	  user = User.find(1)
	  user.session_id = session_id
    user.f = params[:f]
    user.save
    render :json => user
	end
>>>>>>> 8950ecedf09530a79d5d518e055f1de2d2468712
end
