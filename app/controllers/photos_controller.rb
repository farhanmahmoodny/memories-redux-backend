class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    render json: @photos
  end

  def show
    @photo = Photo.find(params[:id])
    render json: @photo
  end

  def create
    @photo = Photo.create(image: params[:image], location: params[:location], description: params[:description], memory_id: params[:memory_id])
    render json: @photo
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(image: params[:image], location: params[:location], description: params[:description])
    render json: @photo
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

end
