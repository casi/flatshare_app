class Admin::AdminController < ApplicationController

  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:index]

  def index
  	@users = User.all
    @infos_narch = Info.not_archived
    @infos_arch = Info.archived
  end

  private
    # Before filter
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
