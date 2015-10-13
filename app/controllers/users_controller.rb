class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def show
    @user = User.find_by(id: params[:id])
    @average_rating = @user.average_rating
  end

  def new
  	@user = User.new
    @location = Location.new
  end

  # TABS!!!
  def create
  	user = User.new(user_params)
  	if user.save && user.valid?
      # Might be nice to have a user.set_location method??
      # user.set_location(params[:user])
       user.locations.create(longitude:params[:user][:long], latitude:params[:user][:lat])
  		session[:user_id] = user.id
  		redirect_to activities_path
  	else
  		flash[:error] = "Invalid field, please try again"
  		redirect_to new_user_path
  	end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :gender, :description, :age, :avatar)
  end


end
