class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
include SessionsHelper
end

def logged_in
  !current_user.nil?
end

def authorized
  redirect_to '/welcome' unless logged_in
end
