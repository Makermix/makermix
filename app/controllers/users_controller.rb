class UsersController < ApplicationController

  def create
    # p params
    # cohort =  Cohort.find()
    # cohort.user.create(user_params)
    User.create(user_params)
    render :nothing => true
  end

  def user_params
    params.permit(:name)
  end
end
