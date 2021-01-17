class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

#  around_action :switch_locale

#  def switch_locale(&action)
#    locale = current_user.try(:locale) || I18n.default_locale
#    I18n.with_locale(locale, &action)
#  end

  private

  # Confirms a logged in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = t 'controllers.application.log-in'
      redirect_to login_url
    end
  end
end
