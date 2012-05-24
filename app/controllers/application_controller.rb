class ApplicationController < ActionController::Base
  protect_from_forgery
  protected
    def session_id
      request.headers["X-Session-ID"]
    end
end
