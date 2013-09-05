class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by name: params[:session][:name]
    if user.try :authenticate, params[:session][:password]
      sign_in user
      redirect_to root_path
    else
      redirect_to users_path
    end
  end
  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    sign_out
    redirect_to users_path
  end

end
