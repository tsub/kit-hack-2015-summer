class FaceSelectionsController < ApplicationController
  skip_before_filter :require_valid_token, only: :show

  def index
    token_check
    @face_selections = User.where(gender: @current_user.gender ^ 1).limit(5)
  end

  def show
    @face_selections = FaceSelection.where(gender: params[:id].to_i ^ 1)
  end

  def create
    token_check
    params[:face_type_id].each do |type|
    @current_user.preference_faces.find_or_create_by!({
        user_id: @current_user.id,
        face_type_id: type
      })
    end
    respond_to do |format|
      format.json { head :created }
    end
  end
end
