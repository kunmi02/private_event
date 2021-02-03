class AttendeeController < ApplicationController
  # GET /attendee/new

  def index
    @attendee = Attendee.all
  end

  def new
    @attendee = Attendee.new
  end

  # GET /users/1 or /users/1.json
  def show; end

  def create
    @username = params[:username]
    @attendee = Attendee.new(attendee_params)

    respond_to do |format|
      if @attendee.save
        session[:current_user_id] = @user.id
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @attendee = Attendee.find(params[:id])
  end

  # def attendee_params
  #   params.permit(:username)
  # end
end
