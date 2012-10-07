class PhotosController < ApplicationController
  def self.client
    @client ||= Picasa::Client.new(:user_id => "ieeeucb@gmail.com")
  end

  def index
    @p = PhotosController.client.album.list.entries
  end

  def show
    id = params[:id]
    if id
      @photos = PhotosController.client.album.show(id).entries
      @album = PhotosController.client.album.list.entries.select { |album| album.id == id }.first
    end
  end

end
