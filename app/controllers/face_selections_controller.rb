class FaceSelectionsController < ApplicationController
  skip_before_filter :require_valid_token

  def index
    @face_selections = FaceSelection.where(gender: params[:id].to_i ^ 1)
  end
end
