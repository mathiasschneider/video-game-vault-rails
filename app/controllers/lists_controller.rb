class ListsController < ApplicationController
  before_action :authenticate_user
  def index
    lists = List.where(user_id: current_user.id)
    render json: lists
  end

  def create
    list = List.new({
      title: params[:title],
      public: params[:public],
      user_id: current_user.id
    })
    if list.save
      render json: list
    else
      render json: {errors: list.errors.full_messages}
    end
  end

  def show
    list = List.find(params[:id])
    render json: list
  end

  def update
    list = List.find(params[:id])
    if current_user.id == list.user_id
      list.title = params[:title] || list.title
      list.public = true
      # list.public = params[:public] || list.public
      # if list.public == "true"
      #   list.public = true
      # else
      #   list.public = false
      # end

      if list.save
        render json: list
      else
        render json: {errors: list.errors.full_messages}
      end
    else
      render json: {message: "you are not the author of this list."}
    end
  end

  def destroy
    list = List.find(params[:id])
    if current_user.id == list.user_id
      list.destroy
      render json: {message: "#{list.title} successfully deleted."}
    else
      render json: {message: "you are not the author of this list."}
    end
  end

end
