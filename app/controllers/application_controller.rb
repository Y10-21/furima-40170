class ApplicationController < ActionController::Base
<<<<<<< HEAD
  before_action :basic_auth
  
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
=======
>>>>>>> parent of d07a21b (commit basic)
end
