class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, book_id: params[:id])
    redirect_to _path
  end
end
