class ApplicationController < ActionController::Base
  before_filter :authenticate, :except => [:index, :show]

  protect_from_forgery

  protected
    # returns the currently logged in user or nil if the user doesn't exist
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end

    # make current user available in templates as a helper
    helper_method :current_user

   # filter method to enforce a login requirement
   def authenticate
     logged_in? ? true : access_denied
   end

   # predicate method to test for a logged in user
   def logged_in?
     current_user.is_a? User
   end

   # make logged_in? available in templates as a helper
   helper_method :logged_in?

   def access_denied
     redirect_to login_path, :notice => "Please log in to continue" and return false
   end
end
