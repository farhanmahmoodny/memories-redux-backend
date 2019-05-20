class MemoriesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    @memories = Memory.all
    render json: @memories
  end

  def show
    @memory = Memory.find(params[:id])
    render json: @memory
  end

  def create
    @memory = Memory.create(title: params[:title], date: params[:date], user_id: params[:user_id])
    render json: @memory
  end

  def update
    @memory = Memory.find(params[:id])
    @memory.update(title: params[:title], date: params[:date])
    render json: @memory
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
  end

end
