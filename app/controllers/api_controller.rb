class ApiController < ApplicationController
	def get_hash
		terminal = Terminal.find_by_hash(params[:hash])
		render :json => {hash: 'test_Hash'}
	end

	def set_hash
		
	end
end
