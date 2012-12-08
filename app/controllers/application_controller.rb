class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def  admin_user
    if !current_user.nil?
      redirect_to games_path unless is_admin?
    else
      redirect_to games_path
    end
  end
end
