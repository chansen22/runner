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

  def moderator
    if !current_user.nil?
      redirect_to games_path unless is_admin? || !Game.find(params[:game_id]).where(user_id: current_user.id).empty?
    else
      redirect_to games_path
    end
  end
end
