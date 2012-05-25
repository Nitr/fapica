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
		render :json => User.joins(:logs,:company)
		.select('users.id, users.email, users.f, users.i, users.o, users.job, users.photo, 
		companies.name, logs.visit, logs.visit_type').order('logs.visit DESC').limit(1)
	end

	def logs
		render :json => Log.find(:all, :order => 'visit DESC')	
	end

	def user_update
	  user = User.find(1)
	  user.session_id = session_id
    user.f = params[:f]
    user.save
    render :json => user
	end

end