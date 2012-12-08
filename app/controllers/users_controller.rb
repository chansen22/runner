class UsersController < ApplicationController
  before_filter :admin_user, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if signed_in?
      @following = Follow.where("followee_id = ? AND user_id = ?", params[:id], current_user.id)
    end
  end

  def moderate
    @user = User.find(params[:id])
    @games = Game.all.collect { |g| [g.name, g.id] }
    @moderator = []
  end

  def moderateset
    @users = User.all
    @user = User.find(params[:user_id])
    @game = Game.find(params[:game_id])
    if @user.moderates.where(game_id: @game.id).empty?
      @user.moderates << Moderate.new(user_id: @user.id, game_id: @game.id)
      redirect_to users_path
    else
      render 'index', notice: "#{@user.username} already moderates that game"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user, notice: "Welcome to SpeedRunner #{@user.first_name}"
    else
      render 'new', notice: "Something went wrong"
    end
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
