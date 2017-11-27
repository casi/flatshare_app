class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:rules, :housework]

  def rules
  end

  def housework
  end
end
