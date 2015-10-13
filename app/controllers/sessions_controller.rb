class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:index,:new,:create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email])
    # This method is a bit long.  Can you refactor anything?
    if user.try(:authenticate, session_params[:password])
      log_user_in!(user, session_params[:lat], session_params[:long])
      flash[:message] = "You've succesfully logged in"

      # This would be a nice refactoring:
      # if current_user.next_match
      #   redirect_to match_path(current_user.next_match)
      # else
      #   render file: "error"
      # end

      potential_matches = get_potential_matches(current_user)
      next_match = find_next_match(current_user, potential_matches)
      if next_match == nil
        render file: "error"
      else
        redirect_to match_path(next_match)
      end
    else
      flash[:error] = "Invalid field, try logging in again"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = "You've been succesfully logged out"
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password,:lat,:long)
  end
end
