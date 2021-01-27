class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /sign_in
  def sign_in
    @user = User.new
    # @username = params[:username]
    # @user = User.find_by(email: @username)
    # respond_to do |format|
    #   if User.where(username: @username).any?
    #     format.html { redirect_to root_path, notice: 'User logged in successfully'}
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #   end
    # end
    
  end

  def log_in
    logger.info "Processing the req..."
    @username = params[:username]
    # @user = User.find_by(username: @username)
    @user = User.where(username: 'Akinkunmi02').any?
    
      if @user
        # flash[:alert] = 'User  found.'
        logger.info "Processing the requ..."
        redirect_to root_path
        # render :show
      else
        flash[:alert] = 'User not found.'
        logger.info "Processing the request..."
        # render :new
        redirect_to @user
      end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email)
    end
end
