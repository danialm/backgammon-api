class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_user, except: [:index, :create]
  before_action :create_user, only: [:create]
  before_action :set_users, only: [:index]
  before_action :update_user, only: [:update]

  def update
    render json: {}, status: 200
  end

  def index
    render json: @users, status: 200
  end

  def create
    render json: {}, status: 201
  end

  def show
    render json: current_user.to_hash, status: 200
  end

  private

  def update_user
    user = current_user.update_attributes user_edit_params[:user]
    unless user.errors.blank?
      render json: user.errors.full_messages, status: 400
    end
  end

  def set_users
    @users = User.all
  end

  def create_user
    user = User.create user_params

    unless user.errors.blank?
      render json: user.errors.full_messages, status: 406
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def user_edit_params
    user_params.permit(:password)
  end
end
