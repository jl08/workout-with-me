class SessionsController < ApplicationController
  def index
  end

  def new
  	#this is temporary for testing purposes
  	session[:user_id] = 1
  	redirect_to new_match_path
  end
end