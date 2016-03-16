class PhotosController < ApplicationController

  before_action do
    request.format = :json
  end

  def index
    @photos = Photo.all
    render json: @photos
  end

  def show
    @photo = Photo.find_by id: params[:id]
    render json: @photo
  end

  def create
    @photo = Photo.new #params.require(:photo).permit(:title, :url, :thumbnailUrl)
    @photo.title = params[:title]
    @photo.url = params[:url]
    @photo.thumbnailUrl = params[:thumbnailUrl]
    if @photo.save
      render json: @photo
    else
      # figure out what to do here

      render json: @photo.errors, status: 422
    end
  end

  def update
    @photo = Photo.find_by id: params[:id]

    @photo.title = params[:title]
    @photo.url = params[:url]
    @photo.thumbnailUrl = params[:thumbnailUrl]
    # @photo.update params.require(:photo).permit(:title, :url, :thumbnailUrl)
    if @photo.save
      render json: @photo
    else
      # figure out what to do here
      render json: @photo.errors, status: 422
    end
  end

  def delete
    @photo = Photo.find_by id: params[:id]
    @photo.delete
    head :ok
  end
end
