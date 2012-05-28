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
		users =  User.joins(:logs, :company).select('users.id, users.email, users.f, users.i, users.o, users.job, users.photo, companies.name, logs.visit, logs.visit_type').order('logs.visit DESC').limit(2)
		user = users.first
		user_last = users.last
		render :json => { :id => user.id,
								:email => user.email,
								:f => user.f, 
								:i => user.i, 
								:o => user.o,
								:job => user.job, 
								:photo => user.photo, 
								:visit_last => {:date => user.visit.to_s, :type => user.visit_type},
								:visit_penult => {:date => user_last.visit.to_s, :type => user_last.visit_type}
								}
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
			log.session_id = session_id
			log.save
			render :json => user
		end
	end

end
