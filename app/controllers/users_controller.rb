require 'bcrypt'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :validate, only: [:get]
  # include BCrypt

  # get /test
  def test
    # render json: [:msg => 'hola mundo']
    render json: [:msg => BCrypt::Password.create('carlos')]
  end

  # GET /users
  def index
    # @users = User.all
    @users = User.select('id',  'name', 'token')

    render json: @users
  end

  # GET /users/1
  def show
    secret_key = request.headers["token"]
    # render json: @user
    render json: secret_key
  end
  
  # GET /users/1
  def get
    if @validated
      render json: @user
    else
      render json: [:msg => 'no autorizado'], status: 401
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = BCrypt::Password.create(@user.password)
    @user.repassword = BCrypt::Password.create(@user.repassword)
    @user.token = BCrypt::Password.create(@user.email)
    @user.retoken = BCrypt::Password.create(@user.email)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /login
  def login
    @user = User.new(user_params)
    @test = User.find_by(:email => @user.email)

    if(!@test.nil? && BCrypt::Password.new(@test.password) == @user.password)
      @test.token = BCrypt::Password.create(@test.email)
      @test.retoken = BCrypt::Password.create(@test.email)
      @test.save
      render json: @test, status: 200
    else
      render json: [error: "credenciales invalidas"], status: 300
    end
  end

  #POST /code
  def code
    @user = User.new(user_params)
    @test = User.find_by(:email => @user.email)
    if(!@test.nil?)
      render json: rand(100000..999999)
    else
      render json: [error: "correo no existe"], status: 500
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def validate
      secret_key = request.headers["token"]
      @user = User.find(params[:id])
      if @user.token = secret_key
        @validated = true
      else
        @validated = false
      end
      
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :password, :repassword, :email)
    end
end
