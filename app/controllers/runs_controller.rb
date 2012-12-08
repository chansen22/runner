class RunsController < ApplicationController
  before_filter :moderator, only: [:verifyrun]
  def index
    @runs = Run.all

    respond_to do |format|
      format.html
      format.json { render json: @runs }
    end
  end

  def show
    @run = Run.find(params[:id])
    @game = @run.game
    @comments = Comment.where("run_id=?", @run.id)
    @comment = Comment.new()
    if @run.url =~ /youtube/
      @youtube = true
      @suburl = @run.url.split("=").last
    else
      @youtube = false
    end

    respond_to do |format|
      format.html
      format.json { render json: @run }
    end
  end

  def new
    @game = Game.find(params[:game_id])
    @run = Run.new

    respond_to do |format|
      format.html
      format.json { render json: @run }
    end
  end

  def edit
    @run = Run.find(params[:id])
  end

  def create
    @game = Game.find(params[:game_id])
    @run = @game.runs.create(params[:run])
    @run.user = current_user
    if @run.url =~ /.+\..+/
      @run.verified = true
    else
      @run.verified = false
    end

    if @run.save
      redirect_to game_path(@game), notice: 'Run was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @game = Game.find(params[:game_id])
    @run = Run.find(params[:id])

    respond_to do |format|
      if @run.update_attributes(params[:run])
        @run.user = current_user
        @run.save
        format.html { redirect_to game_path(@game), notice: 'Run was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @run = Run.find(params[:id])
    @run.destroy

    respond_to do |format|
      format.html { redirect_to runs_url }
      format.json { head :no_content }
    end
  end

  def verifyrun
    if Run.togglerun(params[:id])
      redirect_to game_path(Game.find(params[:game_id])), notice: "Run verification toggled"
    else
      redirect_to game_path(Game.find(params[:game_id])), notice: "Could not toggle verification"
    end
  end
end
