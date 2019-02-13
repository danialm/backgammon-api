class PasswordsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate_user, except: [:edit, :update]
  before_action :set_user, only: [:edit, :update]
  before_action :set_token, only: [:edit]
  before_action :verify_token, only: [:update]

  def edit
    UserMailer.forget_password_email(@user, @token).deliver_later
    render json: {}, status: :ok
  end

  def update
    if @user.update(password: user_params[:password], reset_pass_token: nil)
      render json: {}, status: :ok
    else
      render json: @user.errors.full_messages, status: :bad_request
    end
  end

  private

  def set_user
    @user = User.find_by email: user_params[:email]
    render json: ['user'], status: :not_found unless @user
  end

  def set_token
    @token = Digest::SHA1.hexdigest([Time.now, rand].join)[1..10]
    @user.reset_pass_token = @token
    @user.save
  end

  def verify_token
    render json: ['invalid token'], status: :forbidden unless
      @user.valid_token?(user_params[:token])
  end

  def user_params
    params.require(:user).permit(:email, :token, :password)
  end
end
