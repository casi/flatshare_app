class Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit]
  before_action :admin_user, only: [:destroy]

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Update successful!"
      redirect_to edit_admin_user_url
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    @infos_from_user = Info.where(user_id: @user.id)
    @infos_from_user.each do |info|
      info.update_attribute(:user_id, 0)
    end

    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :phone, :birthday, 
                                   :moved_in, :moved_out,
                                   :description, :password,
                                   :password_confirmation, :picture)
    end

    # Before filter

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
