class Farmer::BookmarksController < ApplicationController
  #before_action :authenticate_public!
  #before_action :authenticate_farmer!

  def create
    @farm = Farm.find(params[:farm_id])
    bookmark = @farm.bookmarks.new(public_id: current_public.id)
    bookmark.save
  end

  def destroy
    @farm = Farm.find(params[:farm_id])
    bookmark = @farm.bookmarks.find_by(public_id: current_public.id)
    bookmark.destroy
  end
end
