class GamesController < ApplicationController
  before_action :authenticate_user
  def index
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_api_key}", "Client-ID" => "#{Rails.application.credentials.igdb_client_id}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, platforms, genres; search "zelda"; limit 50;')

    render json: response.parse(:json)
  end

  def show
    response = HTTP.headers("Authorization" => "Bearer #{Rails.application.credentials.igdb_api_key}", "Client-ID" => "#{Rails.application.credentials.igdb_client_id}").post("https://api.igdb.com/v4/games", :body => 'fields id, name, platforms, genres, involved_companies, rating, similar_games, summary; where id = 1034;')

    render json: response.parse(:json)
  end
end