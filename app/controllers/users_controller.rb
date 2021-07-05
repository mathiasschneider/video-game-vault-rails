class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    if current_user.id == user.id
      render json: user
    else
      render json: { message: "You may only view your own user information."}
    end
  end

  def update
    user = User.find(params[:id])
    if current_user.id == user.id
      if params[:password] && params[:password_confirmation]
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
      end
      user.username = params[:username] || user.username
      user.email = params[:email] || user.email
      if user.save
        render json: user
      else
        render json: { errors: user.errors.full_messages }
      end
    else
      render json: { message: "You may only edit your own user information." }
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user.id == user.id
      user.destroy
      render json: { message: "Your account has been successfully deleted." }
    else
      render json: { message: "You may only delete your own account." }
    end
  end
end