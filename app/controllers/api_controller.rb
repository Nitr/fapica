class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:user_update]
  respond_to :json
	#####################
	#API FOR AJAX-CLIENT#
	#####################
	def get_user_role
		render :json => current_user.roles
	end
		
	def users
		render :json => User.joins(:logs, :company).select('users.id, users.email, users.f, users.i, users.o, users.job, users.photo, companies.name, logs.visit, logs.visit_type').order('logs.visit DESC').limit(1)
	end

	def logs
		render :json => Log.find(:all, :order => 'visit DESC')	
	end
	#######################
	#API FOR DEVISE-SERVER#
	#######################
	def get_hash
		terminal = Terminal.find_by_hashkey(params[:hash])
		if terminal.nil?
			render :json => {error: 'Terminal not found'}		
		else
			render :json => terminal.hashkey 
		end
	end

	def set_hash
		
	end
	###############
	#API FOR TESTS#
	###############
	def user_activate
		user = User.find(params[:id])
		if user.nil?
			render :json => {:error => 'User non found'}
		else
			log = Log.new
			log.user_id = user.id
			if params[:enter] == '1'
				log.visit_type = 1
			else
				log.visit_type = 0
			end		
			log.visit = Time.new
			log.save
			render :json => user
		end
	end

end
