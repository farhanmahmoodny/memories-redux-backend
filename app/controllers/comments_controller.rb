class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.create(comment: params[:comment], user_id: params[:user_id], photo_id: params[:photo_id])
    render json: @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

end
