# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # login to startpage (infos pages)
      log_in user
      redirect_to infos_path
    else
      flash.now[:danger] = t 'controllers.sessions.create.danger'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
