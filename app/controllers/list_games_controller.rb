class ListGamesController < ApplicationController
  before_action :authenticate_user
  def create
    list_game = ListGame.new(
      list_id: params[:list_id],
      igdb_game_id: params[:igdb_game_id],
      quantity: params[:quantity]
    )
    if list_game.save
      render json: { message: "GAME.TITLE successfully added to #{list_game.list.title}" }, status: :created
    else
      render json: { errors: list_game.errors.full_messages }, status: :bad_request
    end
  end

  def update
    list_game = ListGame.find_by(id: params[:id])
    list_game.quantity = params[:quantity]
    if list_game.save
      render json: { message: "Quantity updated." }, status: :created
    else
      render json: { errors: list_game.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    list_game = ListGame.find_by(id: params[:id])
    list_game.destroy
    render json: {message: "GAME.TITLE removed from LIST.TITLE."}
  end
end
