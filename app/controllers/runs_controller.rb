class RunsController < ApplicationController
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
    logger.info("\n\n\n\n\n\n\n\nPARAMS IS #{params}")

    respond_to do |format|
      if @run.save
        format.html { redirect_to game_path(@game), notice: 'Run was successfully created.' }
        format.json { render json: @run, status: :created, location: @run }
      else
        format.html { render action: "new" }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @run = Run.find(params[:id])

    respond_to do |format|
      if @run.update_attributes(params[:run])
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
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
end
