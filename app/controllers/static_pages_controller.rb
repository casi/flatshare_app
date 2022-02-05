# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: %i[rules housework]

  def rules
  end

  def housework
  end
end
