class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all.includes(:chats_as_sender, :chats_as_receiver, :messages)
    @users = @users.order(created_at: :desc) # Ordenar por fecha de creación
  end

  # GET /users/:id
  def show
    @user = User.includes(:chats_as_sender, :chats_as_receiver, :messages).find(params[:id])
    @chats = @user.chats_as_sender.or(@user.chats_as_receiver).distinct
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Usuario creado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Filtro de parámetros fuertes
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end