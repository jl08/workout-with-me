class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :find_next_match
  before_action :require_login

  #  TABS!!!!!!!!!!! :(
  def current_user
    # if logged_in?
    #   return User.find(session[:user_id])
    # end
  	if session[:user_id]
  		return User.find_by(id: session[:user_id])
  	else
  		return nil
  	end
  end

  def logged_in?
    # !!session[:user_id] Return only true/false (not the id itself)
  	session[:user_id]
  end

  def log_user_in! user, lat, long
    session[:user_id] = user.id
    user.locations.first.update_attributes(latitude: lat, longitude: long)
  end

  def find_next_match(current_user, potential_matches)
    # This method more appropriately belongs to a User object - move it there.
    #
    # Pretty odd to iterate a ruby array this way... why not
    #
    # potential_matches.each do |match|
    #   ...
    # end
    for x in 0..potential_matches.length

      # There is probably some refactoring that can happen here... there is a lot of
      # duplication
      #
      if Match.where(initiator_id: current_user.id, responder_id: potential_matches[x]) != []
        next
      elsif Match.where(initiator_id: potential_matches[x], responder_id: current_user.id, accepted: 1) != []
        next
      elsif Match.where(initiator_id: potential_matches[x], responder_id: current_user.id, accepted: -1) != []
        next
      else
        return potential_matches[x]
      end
    end
  end

  # This is almost what you have below... try to implement something like this
  # on your User model please.
  #
  # class User
  #   def get_potential_matches
  #     activities.map do |activity|
  #       activity.users.reject { current_user == user }
  #     end.flatten
  #   end
  # end

  def get_potential_matches(current_user)
    # This logic should be in the user model I think...
    # Also, you may want to move this logic into the database... once the db
    # is large, this is going to be costly timewise...
    potential_matches = []
    current_user.activities.each do |activity|
      activity.users.each do |user|
        if current_user != user
          potential_matches << user
        end
      end
    end
    return potential_matches
  end

  # Move this to the Location model
  def calculate_distance(loc1, loc2)
    # I would move this into a model as well.  Not controller code!
    # Controller code controls the flow of the application.  It should not be
    # doing calculations

    # Hey this is the Great Circle Distance calculation... Found it here:
    # https://en.wikipedia.org/wiki/Great-circle_distance
    rad_per_deg = Math::PI/180
    rkm = 6371
    rm = rkm * 1000

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    (rm * c) * (0.00062137)
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "Please login to view"
      redirect_to root_path
    end
  end

end
