class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_valid_token, only: :create

  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1.json
  def show
    if !@user
      respond_to do |format|
        format.json { render nothing: true, status: :not_found }
      end
    end
  end

  # POST /users.json
  def create
    respond_to do |format|
      @user = User.new(user_params)

      if @user.save
        format.json { render nothing: true, status: :created }
      else
        logger.debug @user.errors.full_messages
        format.json { render nothing: true, status: :bad_request }
      end
    end
  end

  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render json: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :my_number, :address, :hobby, :gender, :face_type_id, :avatar, :birthdate, work_experiences_attributes: [:company_name, :joined_at, :quited_at], educational_backgrounds_attributes: [:school_name, :joined_at, :quited_at], medical_histories_attributes: [:disease_name, :joined_at, :quited_at], crime_histories_attributes: [:crime_name, :crimed_at], preference_faces_attributes: [:face_type_id])
  end
end
