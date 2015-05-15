class SessionsController < ApplicationController

  def create
  end

  def destroy
    session[:user_id] = nil
    render :nothing => true
  end

end
