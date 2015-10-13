class ActivitiesController < ApplicationController

  def index
    @activities = Activity.new
  end

  def create
    user = User.find_by(id: current_user.id) # should be current user
    chosen_activities = params[:name]
    if chosen_activities
      chosen_activities.each do |activity|

        # Use Activity.find_or_create_by() instead of this big if/else statement
        if Activity.find_by(name: activity)
          activity = Activity.find_by(name: activity)
        else
          activity = Activity.create(name: activity)
        end
        user.activities << activity
      end
      redirect_to initiate_match_path
    else
      flash[:error] = "Must choose at least 1 activity"
      redirect_to activities_path
    end
  end

  def destroy
    activity = Activity.find_by(id: params[:id])
    current_user.activities.delete(activity)
    redirect_to edit_user_path(current_user)
  end

  private

    def params_activity
      params.require(:activity).permit(:name)
    end

end
