class LeaderboardsController < ApplicationController
  # GET /leaderboards
  # GET /leaderboards.json
  def index
    @leaderboards = Leaderboard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leaderboards }
    end
  end

  # GET /leaderboards/1
  # GET /leaderboards/1.json
  def show
    @leaderboard = Leaderboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leaderboard }
    end
  end

  # GET /leaderboards/new
  # GET /leaderboards/new.json
  def new
    @leaderboard = Leaderboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leaderboard }
    end
  end

  # GET /leaderboards/1/edit
  def edit
    @leaderboard = Leaderboard.find(params[:id])
  end

  # POST /leaderboards
  # POST /leaderboards.json
  def create
    @leaderboard = Leaderboard.new(params[:leaderboard])

    respond_to do |format|
      if @leaderboard.save
        format.html { redirect_to @leaderboard, notice: 'Leaderboard was successfully created.' }
        format.json { render json: @leaderboard, status: :created, location: @leaderboard }
      else
        format.html { render action: "new" }
        format.json { render json: @leaderboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leaderboards/1
  # PUT /leaderboards/1.json
  def update
    @leaderboard = Leaderboard.find(params[:id])

    respond_to do |format|
      if @leaderboard.update_attributes(params[:leaderboard])
        format.html { redirect_to @leaderboard, notice: 'Leaderboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leaderboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaderboards/1
  # DELETE /leaderboards/1.json
  def destroy
    @leaderboard = Leaderboard.find(params[:id])
    @leaderboard.destroy

    respond_to do |format|
      format.html { redirect_to leaderboards_url }
      format.json { head :no_content }
    end
  end
end
