class ApiController < ApplicationController
	def get_hash
		terminal = Terminal.find_by_hashkey(params[:hash])
		if terminal.empty? || terminal.nil?
			render :json => {error: 'Terminal not found'}		
		else
			render :json => terminal.hashkey 
		end
		#render :json => terminal
	end

	def set_hash
		
	end
end
