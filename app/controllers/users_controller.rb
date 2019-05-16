class UsersController < ApplicationController
  skip_before_action :authorized, only: [:login, :get_user, :create, :index]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    if @user.valid?
      @token = encode_token(@user.id)
      # byebug
      render json: {user: UserSerializer.new(@user), token: @token}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:name], email: params[:email], username: params[:username])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token(@user.id)
      render json: {user: UserSerializer.new(@user), token: token},
      status: :accepted
    else
      render json: {message: 'Invalid username or password'}, status:
      :unauthorized
    end
  end

  def get_user
    if current_user
      render json: {user: UserSerializer.new(current_user)}
    end
  end

end
