class ApiController < ApplicationController\
	def get_hash
		render :json => {hash: 'test_Hash'}
	end

	def set_hash
		
	end
end
