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
    if list.public || list.user_id == current_user.id
      render json: list
    else
      render json: {message: "You do not have permission to view this list."}
    end
  end

  def update
    list = List.find(params[:id])
    if current_user.id == list.user_id
      list.title = params[:title] || list.title
      list.public = params[:public] || list.public
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
