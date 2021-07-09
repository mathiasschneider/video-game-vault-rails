class ListGamesController < ApplicationController
  before_action :authenticate_user
  def create
    list_game = ListGame.new(
      list_id: params[:list_id],
      igdb_game_id: params[:igdb_game_id],
      quantity: params[:quantity],
      title: params[:title],
      image_url: params[:image_url]
    )
    if current_user.id == list_game.list.user_id
      if list_game.save
        render json: { message: "Game successfully added to #{list_game.list.title}." }, status: :created
      else
        render json: { errors: list_game.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "You cannot add a game to a list you do not own."}
    end
  end

  def update
    list_game = ListGame.find_by(id: params[:id])
    if current_user.id == list_game.list.user_id
      list_game.quantity = params[:quantity]
      if list_game.save
        render json: { message: "Quantity updated." }, status: :created
      else
        render json: { errors: list_game.errors.full_messages }, status: :bad_request
      end
    else
      render json: { message: "You do not have permission to edit this item."}
    end
  end

  def destroy
    list_game = ListGame.find_by(id: params[:id])
    if current_user.id == list_game.list.user_id
      list_game.destroy
      render json: {message: "game successfully removed from #{list_game.list.title}."}
    else
      render json: { message: "You cannot delete games from lists you do not own." }, status: :bad_request
      # render json: { errors: list_game.errors.full_messages }, status: :bad_request
    end
  end
end
