class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json

  # GET /comments/new
  # GET /comments/new.json
  def new
    @game = Game.find(params[:game_id])
    @run = Run.find(params[:run_id])

    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @game = Game.find(params[:game_id])
    @run = Run.find(params[:run_id])
    @comment = @run.comments.create(params[:comment])
    @comment.run_id = @run.id
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to game_run_path(@game, @run), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
