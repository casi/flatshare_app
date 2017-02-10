class Admin::InfosController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit]
  before_action :admin_user, only: [:destroy]

  def destroy
	Info.find(params[:id]).destroy
    flash[:success] = 'Info deleted.'
    redirect_to admin_url
  end

  private 
     # Before filter

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
