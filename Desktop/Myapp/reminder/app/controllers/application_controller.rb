class ApplicationController < ActionController::Base
  def current_user
      User.find(session[:user_id])
  end
  protect_from_forgery
end
